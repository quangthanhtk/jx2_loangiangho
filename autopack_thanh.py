import ntpath
import os
import shutil
import subprocess
from distutils.dir_util import copy_tree
from enum import Enum
from pathlib import Path


class Platform(Enum):
    WINDOWS = "windows"
    LINUX = "linux"


class Mode(Enum):
    DEBUG = "debug"
    RELEASE = "release"


class Side(Enum):
    CLIENT = 1
    SERVER = 2
    BOTH = 3


# Custom pack output here
BRAND_NAME = "jx2_loangiangho"
ROOT_OUTPUT = "E:/Games"
PACK_SIDE = Side.BOTH
PACK_ALL = False


DEPLOY_ROOT_PATH = Path(ROOT_OUTPUT + "/" + BRAND_NAME + "/deploy")
STAGING_ROOT_PATH = Path(ROOT_OUTPUT + "/" + BRAND_NAME + "/client_test")
RELEASE_ROOT_PATH = Path(ROOT_OUTPUT + "/" + BRAND_NAME + "/client_release")
TOOL_ROOT_PATH = "./dev_tools"

PACK_APP = TOOL_ROOT_PATH + "/Pack/PackFile.exe"

SRC_DIR = os.getcwd()
CLIENT_RES = Path(SRC_DIR).joinpath("client")
SHARED_RES = Path(SRC_DIR).joinpath("shared")
SERVER_RES = Path(SRC_DIR).joinpath("server")
BUILD_DIR = Path(SRC_DIR).joinpath("build")

save_encoding_to = SRC_DIR + "\\output"


def p7zip(item, zipfile):
    subprocess.check_call(["7z", "u", "-r", zipfile, item])


def convert_file_encoding(from_encoding="iso-8859-1", to_encoding="gbk", path=SRC_DIR, save=save_encoding_to):
    for root, dirs, files in os.walk(path):
        for file in files:
            file_name = os.path.join(root, file)
            if ".git" in file_name or '.idea' in file_name \
                    or 'shell' in file_name or 'covert_filename' in file_name or '.md' in file_name:
                continue
            new_file = file_name.encode(from_encoding).decode(to_encoding)
            new_file = new_file.replace(path, save + "\\" + to_encoding)
            os.makedirs(os.path.dirname(new_file), exist_ok=True)
            shutil.copyfile(file_name, new_file)


def pack_single(folder, name, root_dir):
    command = f'{PACK_APP} P -P"{name}.pak" -R{root_dir} -D{folder}'
    subprocess.call(command)


def combine_pack(src, target):
    command = f'{PACK_APP} C -P"{src}.pak" -A"{target}.pak"'
    subprocess.call(command)


def remove_pack(file):
    os.remove(file + ".pak")
    os.remove(file + ".pak.txt")


def copy_pack(src, des, is_server=False, is_client=False):
    extension = ".pak"
    if is_server:
        extension = "_s.pak"
    # if is_client:
    #     extension = "_c.pak"
    shutil.copyfile(src + ".pak", des + extension)
    if is_server:
        shutil.move(src + ".pak.txt", des + extension + ".txt")
    else:
        os.remove(src + ".pak.txt")


def move_pack(src, des, is_server=False, is_client=False):
    extension = ".pak"
    if is_server:
        extension = "_s.pak"
    # if is_client:
    #     extension = "_c.pak"
    shutil.move(src + ".pak", des + extension)
    if is_server:
        shutil.move(src + ".pak.txt", des + extension + ".txt")
    else:
        os.remove(src + ".pak.txt")


def path_leaf(path):
    head, tail = ntpath.split(path)
    return tail or ntpath.basename(head)


def deploy_client(mode: Mode, pack_all=False):
    # Define output
    client_output = DEPLOY_ROOT_PATH.joinpath("patch.7z")
    client_patch = DEPLOY_ROOT_PATH.joinpath("patch")

    # Clean old update
    print("[Client] Clean old update")
    try:
        shutil.rmtree(client_patch)
        os.remove(client_output)
    except OSError:
        pass

    # Prepare source
    Path(client_patch).mkdir(parents=True, exist_ok=True)
    pack_client_folders = ["ui", "script", "settings"]
    if pack_all:
        pack_client_folders += ["image", "uimage", "sound", "spr", "游戏资源", "maps", "font", "music"]

    # 1st: Copy from client side only
    for folder in pack_client_folders:
        if os.path.exists(CLIENT_RES.joinpath(folder)):
            copy_tree(str(CLIENT_RES.joinpath(folder)), str(client_patch.joinpath(folder)), verbose=1, update=1)
    print("[Client] Copy client files to {0} -> done.".format(client_patch))

    # 2nd: Copy from shared
    shared_dir = DEPLOY_ROOT_PATH.joinpath("clientserver")
    for folder in pack_client_folders:
        if os.path.exists(shared_dir.joinpath(folder)):
            copy_tree(str(shared_dir.joinpath(folder)), str(client_patch.joinpath(folder)), verbose=1, update=1)
    print("[Client] Copy shared files to {0} -> done.".format(client_patch))

    # Rename all files and folders to lowercase
    for file in os.listdir(client_patch):
        if file != file.lower():
            os.rename(client_patch.joinpath(file), client_patch.joinpath(file.lower()))

    # START CASE 1: This code for case have full resource
    # Packing elements .pak
    pak_path = client_patch.joinpath("data")
    Path(pak_path).mkdir(parents=True, exist_ok=True)
    for folder in pack_client_folders:
        pack_name = folder
        if folder == "游戏资源":
            pack_name = "resource"
        if os.path.exists(client_patch.joinpath(folder)):
            print(f'[Client] Packing {pack_name}...')
            pack_single(folder, pack_name, client_patch)
            move_pack(str(client_patch.joinpath(pack_name)), str(pak_path.joinpath(pack_name)))
            shutil.rmtree(client_patch.joinpath(folder))

    # Packing update.pak
    update_folders = ["update"]
    if pack_all:
        update_folders += ["update2022"]
    for folder in update_folders:
        pack_name = folder
        if os.path.exists(CLIENT_RES.joinpath(folder)):
            print(f'[Client] Packing {folder} folder...')
            pack_single(".", client_patch.joinpath(pack_name), CLIENT_RES.joinpath(folder))
            move_pack(str(client_patch.joinpath(pack_name)), str(pak_path.joinpath(pack_name)))
    # END CASE 1

    # Packing serverlist.pak
    folder = "settings"
    pack_name = "serverlist"
    temp_path = client_patch.joinpath(folder)
    temp_path.mkdir(parents=True, exist_ok=True)
    serverlist_path = Path("settings/server_list.ini")
    shutil.copy(str(CLIENT_RES.joinpath(serverlist_path)), temp_path)
    print(f'[Client] Packing serverlist: {serverlist_path}...')
    pack_single(folder, pack_name, client_patch)
    move_pack(str(client_patch.joinpath(pack_name)), str(pak_path.joinpath(pack_name)))
    shutil.rmtree(temp_path)

    # Copy client files
    shutil.copy(str(CLIENT_RES.joinpath('config.ini')), client_patch)
    shutil.copy(str(CLIENT_RES.joinpath('package.ini')), client_patch)
    shutil.copy(str(CLIENT_RES.joinpath('version.cfg')), client_patch)

    # # Update version.cfg
    # print("[Client] Update version file...")
    # write_new_version_file(client_patch)
    # print("[Client] Version file -> updated.")

    # # Zipping
    # print("[Client] Create patch file...")
    # p7zip(str(client_patch) + "\\*", client_output)

    # 3rd: Copy from build dir
    build_dir_client = BUILD_DIR.joinpath(mode.value).joinpath("client")
    copy_tree(str(build_dir_client), str(client_patch), verbose=1, update=1)
    print("[Client] Copy build files to {0} -> done.".format(client_patch))

    # 4th: Copy from static files
    static_res = BUILD_DIR.joinpath(mode.value).joinpath("client_static_files")

    # Auto copy once at create client_test
    if not os.path.exists(STAGING_ROOT_PATH):
        print("[Client] Create client_test...")
        STAGING_ROOT_PATH.mkdir(parents=True, exist_ok=True)
        if os.path.exists(static_res):
            copy_tree(str(static_res), str(STAGING_ROOT_PATH), verbose=1)

    # copy path to staging
    print("[Client] Copy patch to client_test...")
    copy_tree(str(client_patch), str(STAGING_ROOT_PATH), verbose=1)

    # Copy only by release mode
    if mode == Mode.RELEASE:
        # Auto copy once at create client_release
        if not os.path.exists(RELEASE_ROOT_PATH):
            print("[Client] Create client_release...")
            RELEASE_ROOT_PATH.mkdir(parents=True, exist_ok=True)
            if os.path.exists(static_res):
                copy_tree(str(static_res), str(RELEASE_ROOT_PATH), verbose=1)

        # copy path to release
        print("[Client] Copy patch to client_release...")
        copy_tree(str(client_patch), str(RELEASE_ROOT_PATH), verbose=1)

    print("[Client] Done!")


def deploy_server(mode: Mode, pack_all=False):
    # Define output
    server_output = DEPLOY_ROOT_PATH.joinpath("server.7z")
    server_patch = DEPLOY_ROOT_PATH.joinpath("server")

    # Clean old update
    print("[Server] Clean old update")
    try:
        shutil.rmtree(server_patch)
        os.remove(server_output)
    except OSError:
        pass
    pass

    # Prepare source
    Path(server_patch).mkdir(parents=True, exist_ok=True)
    pack_server_folders = ["settings"]
    if pack_all:
        pack_server_folders += ["script", "maps"]

    # 1st: Copy from server side only
    copy_tree(str(SERVER_RES), str(server_patch), verbose=1, update=1)
    print("[Server] Copy server files to {0} -> done.".format(server_patch))

    # 2nd: Copy from shared
    shared_dir = DEPLOY_ROOT_PATH.joinpath("clientserver")
    gameserver_dir = server_patch.joinpath("gameserver")
    gameserver_data = gameserver_dir.joinpath("data")
    copy_tree(str(shared_dir), str(gameserver_dir), verbose=1, update=1)
    print("[Server] Copy shared files to {0} -> done.".format(server_patch))

    # 3rd: Copy from build dir
    build_dir_server = BUILD_DIR.joinpath(mode.value).joinpath("server")
    copy_tree(str(build_dir_server), str(server_patch), verbose=1, update=1)
    print("[Server] Copy build files to {0} -> done.".format(server_patch))

    # Packing
    Path(gameserver_data).mkdir(parents=True, exist_ok=True)
    for folder in pack_server_folders:
        print(f'[Server] Packing {folder}...')
        pack_single(folder, folder, gameserver_dir)
        move_pack(str(gameserver_dir.joinpath(folder)), str(gameserver_data.joinpath(folder)), is_server=True)
        shutil.rmtree(str(gameserver_dir.joinpath(folder)))
    # shutil.rmtree(str(gameserver_dir.joinpath("maps")), ignore_errors=True)

    # # Zipping
    # print("[Server] Create patch file...")
    # p7zip(server_patch, server_output)

    print("[Server] Done!")


def deploy_update(mode: Mode = Mode.RELEASE, side: Side = Side.BOTH, pack_all=False):
    if not isinstance(mode, Mode):
        raise TypeError('mode must be debug or release')
    if not isinstance(side, Side):
        raise TypeError('invalid side')
    print("[Start] Pack all = {0}, mode = {1}, side = {2}".format(pack_all, mode, side))
    is_deploy_client = side == Side.CLIENT
    is_deploy_server = side == Side.SERVER
    if side == Side.BOTH:
        is_deploy_client = True
        is_deploy_server = True

    # Copy shared files to clientserver folder
    shared_dir = DEPLOY_ROOT_PATH.joinpath("clientserver")
    if os.path.exists(shared_dir):
        shutil.rmtree(shared_dir)
    copy_tree(str(SHARED_RES), str(shared_dir), verbose=1, update=1)
    if is_deploy_client:
        deploy_client(mode, pack_all)
    if is_deploy_server:
        deploy_server(mode, pack_all)

    print("Finished!")

# Switch pack mode here
deploy_update(side=PACK_SIDE, pack_all=PACK_ALL)
