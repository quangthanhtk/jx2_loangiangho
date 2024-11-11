# Quy tắc chung:

## Hàm:

- Các hàm có tiền tố `Get` sẽ return kết quả cần get.
- Các hàm có tiền tố `Is` sẽ return kết quả `WEnv.TRUE` nếu thành công, `WEnv.FALSE` nếu thất bại.
- Các hàm còn lại sẽ return mặc định `WEnv.RETCODE_SUCCESS` nghĩa là thành công, tùy mỗi hàm định nghĩa mà sẽ return khác nhau, mặc định có các kiểu return sau:
  - `WEnv.RETCODE_SUCCESS` nghĩa là thành công. 
  - `WEnv.RETCODE_ERROR` nghĩa là có lỗi chung chung.
  - `WEnv.RETCODE_UNDEFINE` nghĩa là chưa định nghĩa cái gì đó trong hàm.
- Thay thế các function return nil, dễ crash khi kiểm tra giá trị với nil

## Biến:

- Các tiền tố của biến:
  - `tb`: table
  - `sz`: string
  - `n`: number
  - `b`: bool giá trị lua cho phép 1 hoặc 0
  - `fn`: function
  - `ud`: userdata
  - `_`: nghĩa là biến này không cần quan tâm
  - `m_`: sử dụng local trong file, vd `m_nRoute`
  - `g_`: sử dụng global, vd `g_nRoute`

- Các biến `tbSay` có lời thoại luôn cùng 1 line với biến để khi search dễ thấy nội dung hơn, vd:
```
local tbSay = { "caption blabla", -- cung 1 line voi ten bien
    "option1", -- cac lua chon khac co the khac line
    "option2",
};
```
## Cấu trúc:

- `warlord\\preload.lua`: entry point, reload 1 file sẽ reload tất cả, nhớ reload thêm file cha
- `warlord\\libs\\`: thư mục chứa các file thư viện tái sử dụng, file prefix `lib_`
- `warlord\\tênlib_types\\`: thư mục chứa các file sử dụng lại các thư viện trong libs, file prefix `tênlib_`, nếu sử dụng thì nhớ include ở cuối file lib
- `warlord\\defines\\`: thư mục chứa các file khai báo biến, file prefix `define_`
- `warlord\\npcs\\`: thư mục chứa script của npc, không chịu ảnh hưởng khi reload preload.lua, nếu muốn có tác dụng phải reload cả 2
- `warlord\\functions\\`: thư mục chứa script của tính năng, không chịu ảnh hưởng khi reload preload.lua, nếu muốn có tác dụng phải reload cả 2
- `warlord\\callbacks\\`: thư mục chứa script của các hàm callback, không chịu ảnh hưởng khi reload preload.lua, nếu muốn có tác dụng phải reload cả 2
- `warlord\\fix\\`: thư mục chứa script của các hàm fix lỗi, không chịu ảnh hưởng khi reload preload.lua, nếu muốn có tác dụng phải reload cả 2