----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-16
--- Description: item thŒ ch‰n kim xµ 6 c„ gi˜ c≠Íng h„a d˘a vµo c≠Íng h„a cÒa thŒ
----------------------------------------------------------------------------------------------------
--…±–«¡Ó≈∆£®Õ∑,“¬,ø„£©
--Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
g_CapeDialog_1 = {
    baseAttr = {
        --{ { 2510, 2511 }, { 2517, 2518, 2519, 2520, 2521 }, { 2533, 2534, 2535, 2536, 2537 } }, -- opt xanh
        --{ { 2512, 2513 }, { 2522, 2523, 2524, 2525, 2526 }, { 2538, 2539, 2540, 2541, 2542 } }, -- opt t›m
        { { 2918, 2919 }, { 2931, 2932, 2933, 2934, 2935 }, { 2947, 2948, 2949, 2950, 2951 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2549, 2550, 2551, 2552, 2554, 2554 }, -- opt xanh
        --{ 2555, 2556, 2557, 2558, 2559, 2560 }, -- opt t›m
        { 2965, 2966, 2967, 2968, 2969, 2970 }, -- opt vµng
        
        --- opt 2
        --{ 2568, 2569 }, -- opt xanh
        --{ 2570, 2571 }, -- opt t›m
        { 2976, 2977 }, -- opt vµng
        
        --- opt 3-1
        --{ 2575, 2576, 2577, 2578 }, -- opt xanh
        --{ 2579, 2580, 2581, 2582 }, -- opt t›m
        { 2987, 2988, 2989, 2990 }, -- opt vµng
    },
};

g_BadgeDialog_1 = {
    baseAttr = {
        --{ { 2510, 2511 }, { 2517, 2518, 2519, 2520, 2521 }, { 2533, 2534, 2535, 2536, 2537 } }, -- opt xanh
        --{ { 2512, 2513 }, { 2522, 2523, 2524, 2525, 2526 }, { 2538, 2539, 2540, 2541, 2542 } }, -- opt t›m
        { { 2918, 2919 }, { 2931, 2932, 2933, 2934, 2935 }, { 2947, 2948, 2949, 2950, 2951 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2549, 2550, 2551, 2552, 2554, 2554 }, -- opt xanh
        --{ 2555, 2556, 2557, 2558, 2559, 2560 }, -- opt t›m
        { 2965, 2966, 2967, 2968, 2969, 2970 }, -- opt vµng

        --- opt 2
        --{ 2568, 2569 }, -- opt xanh
        --{ 2570, 2571 }, -- opt t›m
        { 2976, 2977 }, -- opt vµng

        --- opt 3-2
        --{ 2588, 2589, 2590 }, -- opt xanh
        --{ 2591, 2592, 2593 }, -- opt t›m
        { 2998, 2999, 3000 }, -- opt vµng
    },
};

g_FootDialog_1 = {
    baseAttr = {
        --{ { 2510, 2511 }, { 2517, 2518, 2519, 2520, 2521 }, { 2533, 2534, 2535, 2536, 2537 } }, -- opt xanh
        --{ { 2512, 2513 }, { 2522, 2523, 2524, 2525, 2526 }, { 2538, 2539, 2540, 2541, 2542 } }, -- opt t›m
        { { 2918, 2919 }, { 2931, 2932, 2933, 2934, 2935 }, { 2947, 2948, 2949, 2950, 2951 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2549, 2550, 2551, 2552, 2554, 2554 }, -- opt xanh
        --{ 2555, 2556, 2557, 2558, 2559, 2560 }, -- opt t›m
        { 2965, 2966, 2967, 2968, 2969, 2970 }, -- opt vµng

        --- opt 2
        --{ 2568, 2569 }, -- opt xanh
        --{ 2570, 2571 }, -- opt t›m
        { 2976, 2977 }, -- opt vµng

        --- opt 3-3
        --{ 2598, 2599, 2600, 2601, 2602 }, -- opt xanh
        --{ 2603, 2604, 2605, 2606, 2607 }, -- opt t›m
        { 3012, 3013, 3014, 3015, 3016 }, -- opt vµng
    },
};
----------------------------------------------------------------------------------------------------
g_CapeDialog_2 = {
    baseAttr = {
        --{ { 2614, 2615 }, { 2621, 2622, 2623, 2624, 2625 }, { 2637, 2638, 2639, 2640, 2641 } }, -- opt xanh
        --{ { 2616, 2617 }, { 2626, 2627, 2628, 2629, 2630 }, { 2642, 2643, 2644, 2645, 2646 } }, -- opt t›m
        { { 3022, 3023 }, { 3035, 3036, 3037, 3038, 3039 }, { 3051, 3052, 3053, 3054, 3055 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2653, 2654, 2655, 2656, 2657, 2658 }, -- opt xanh
        --{ 2659, 2660, 2661, 2662, 2663, 2664 }, -- opt t›m
        { 3069, 3071, 3072, 3073, 3074,3070}, -- opt vµng

        --- opt 2
        --{ 2672, 2673, 2674 }, -- opt xanh
        --{ 2675, 2676, 2677 }, -- opt t›m
        { 3082, 3083, 3084 }, -- opt vµng

        --- opt 3-1
        --{ 2682, 2683, 2684, 2685 }, -- opt xanh
        --{ 2686, 2687, 2688, 2689 }, -- opt t›m
        { 3094, 3095, 3096, 3097 }, -- opt vµng
    },
};

g_BadgeDialog_2 = {
    baseAttr = {
        --{ { 2614, 2615 }, { 2621, 2622, 2623, 2624, 2625 }, { 2637, 2638, 2639, 2640, 2641 } }, -- opt xanh
        --{ { 2616, 2617 }, { 2626, 2627, 2628, 2629, 2630 }, { 2642, 2643, 2644, 2645, 2646 } }, -- opt t›m
        { { 3022, 3023 }, { 3035, 3036, 3037, 3038, 3039 }, { 3051, 3052, 3053, 3054, 3055 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2653, 2654, 2655, 2656, 2657, 2658 }, -- opt xanh
        --{ 2659, 2660, 2661, 2662, 2663, 2664 }, -- opt t›m
        { 3069, 3071, 3072, 3073, 3074,3070}, -- opt vµng

        --- opt 2
        --{ 2672, 2673, 2674 }, -- opt xanh
        --{ 2675, 2676, 2677 }, -- opt t›m
        { 3082, 3083, 3084 }, -- opt vµng

        --- opt 3-2
        --{ 2682, 2683, 2684, 2685 }, -- opt xanh
        --{ 2686, 2687, 2688, 2689 }, -- opt t›m
        { 3094, 3095, 3096, 3097 }, -- opt vµng
    },
};

g_FootDialog_2 = {
    baseAttr = {
        --{ { 2614, 2615 }, { 2621, 2622, 2623, 2624, 2625 }, { 2637, 2638, 2639, 2640, 2641 } }, -- opt xanh
        --{ { 2616, 2617 }, { 2626, 2627, 2628, 2629, 2630 }, { 2642, 2643, 2644, 2645, 2646 } }, -- opt t›m
        { { 3022, 3023 }, { 3035, 3036, 3037, 3038, 3039 }, { 3051, 3052, 3053, 3054, 3055 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2653, 2654, 2655, 2656, 2657, 2658 }, -- opt xanh
        --{ 2659, 2660, 2661, 2662, 2663, 2664 }, -- opt t›m
        { 3069, 3071, 3072, 3073, 3074,3070}, -- opt vµng

        --- opt 2
        --{ 2672, 2673, 2674 }, -- opt xanh
        --{ 2675, 2676, 2677 }, -- opt t›m
        { 3082, 3083, 3084 }, -- opt vµng

        --- opt 3-3
        --{ 2695, 2696, 2697, 2698 }, -- opt xanh
        --{ 2699, 2700, 2701, 2702 }, -- opt t›m
        { 3107, 3108, 3109, 3110 }, -- opt vµng
    },
};
----------------------------------------------------------------------------------------------------
g_CapeDialog_3 = {
    baseAttr = {
        --{ { 2708, 2709 }, { 2715, 2716, 2717, 2718, 2719 }, { 2731, 2732, 2733, 2734, 2735 } }, -- opt xanh
        --{ { 2710, 2711 }, { 2720, 2721, 2722, 2723, 2724 }, { 2736, 2737, 2738, 2739, 2740 } }, -- opt t›m
        { { 3116, 3117 }, { 3129, 3130, 3131, 3132, 3133 }, { 3145, 3146, 3147, 3148, 3149 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2747, 2748, 2749, 2750, 2751, 2752 }, -- opt xanh
        --{ 2753, 2754, 2755, 2756, 2757, 2758 }, -- opt t›m
        { 3163, 3164, 3165, 3166, 3167, 3168 }, -- opt vµng

        --- opt 2
        --{ 2766, 2767, 2768 }, -- opt xanh
        --{ 2769, 2770, 2771 }, -- opt t›m
        { 3176, 3177, 3178 }, -- opt vµng

        --- opt 3-1
        --{ 2776, 2777, 2778, 2779 }, -- opt xanh
        --{ 2780, 2781, 2782, 2783 }, -- opt t›m
        { 3188, 3189, 3190, 3191 }, -- opt vµng
    },
};

g_BadgeDialog_3 = {
    baseAttr = {
        --{ { 2708, 2709 }, { 2715, 2716, 2717, 2718, 2719 }, { 2731, 2732, 2733, 2734, 2735 } }, -- opt xanh
        --{ { 2710, 2711 }, { 2720, 2721, 2722, 2723, 2724 }, { 2736, 2737, 2738, 2739, 2740 } }, -- opt t›m
        { { 3116, 3117 }, { 3129, 3130, 3131, 3132, 3133 }, { 3145, 3146, 3147, 3148, 3149 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2747, 2748, 2749, 2750, 2751, 2752 }, -- opt xanh
        --{ 2753, 2754, 2755, 2756, 2757, 2758 }, -- opt t›m
        { 3163, 3164, 3165, 3166, 3167, 3168 }, -- opt vµng

        --- opt 2
        --{ 2766, 2767, 2768 }, -- opt xanh
        --{ 2769, 2770, 2771 }, -- opt t›m
        { 3176, 3177, 3178 }, -- opt vµng

        --- opt 3-2
        --{ 2776, 2777, 2778, 2779 }, -- opt xanh
        --{ 2780, 2781, 2782, 2783 }, -- opt t›m
        { 3188, 3189, 3190, 3191 }, -- opt vµng
    },
};

g_FootDialog_3 = {
    baseAttr = {
        --{ { 2708, 2709 }, { 2715, 2716, 2717, 2718, 2719 }, { 2731, 2732, 2733, 2734, 2735 } }, -- opt xanh
        --{ { 2710, 2711 }, { 2720, 2721, 2722, 2723, 2724 }, { 2736, 2737, 2738, 2739, 2740 } }, -- opt t›m
        { { 3116, 3117 }, { 3129, 3130, 3131, 3132, 3133 }, { 3145, 3146, 3147, 3148, 3149 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2747, 2748, 2749, 2750, 2751, 2752 }, -- opt xanh
        --{ 2753, 2754, 2755, 2756, 2757, 2758 }, -- opt t›m
        { 3163, 3164, 3165, 3166, 3167, 3168 }, -- opt vµng

        --- opt 2
        --{ 2766, 2767, 2768 }, -- opt xanh
        --{ 2769, 2770, 2771 }, -- opt t›m
        { 3176, 3177, 3178 }, -- opt vµng

        --- opt 3-3
        --{ 2789, 2790, 2791, 2792, 2793 }, -- opt xanh
        --{ 2794, 2795, 2796, 2797, 2798 }, -- opt t›m
        { 3203, 3204, 3205, 3206, 3207 }, -- opt vµng
    },
};
----------------------------------------------------------------------------------------------------
-------------------------------Kim Xa 8 sao---------------------------------------------
g8_CapeDialog_1 = {
    baseAttr = {
        { { 3312, 3313 }, { 3325, 3326, 3327, 3328, 3329 }, { 3341, 3342, 3343, 3344, 3345 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        { 3359, 3360, 3361, 3362, 3363, 3364 }, -- opt vµng

        --- opt 2
        { 3370, 3371 }, -- opt vµng

        --- opt 3-1
        { 3381, 3382, 3383,3384 }, -- opt vµng
    },
};

g8_BadgeDialog_1 = {
    baseAttr = {
        { { 3312, 3313 }, { 3325, 3326, 3327, 3328, 3329 }, { 3341, 3342, 3343, 3344, 3345 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        { 3359, 3360, 3361, 3362, 3363, 3364 }, -- opt vµng

        --- opt 2
        { 3370, 3371 }, -- opt vµng

        --- opt 3-2
        { 3392, 3393, 3394 }, -- opt vµng
    },
};

g8_FootDialog_1 = {
    baseAttr = {
        { { 3312, 3313 }, { 3325, 3326, 3327, 3328, 3329 }, { 3341, 3342, 3343, 3344, 3345 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        { 3359, 3360, 3361, 3362, 3363, 3364 }, -- opt vµng

        --- opt 2
        { 3370, 3371 }, -- opt vµng

        --- opt 3-3
        { 3406, 3407, 3408, 3409, 3410 }, -- opt vµng
    },
};
----------------------------------------------------------------------------------------------------
g8_CapeDialog_2 = {
    baseAttr = {
        { { 3416, 3417 }, { 3429, 3430, 3431, 3432, 3433 }, { 3445, 3446, 3447, 3448, 3449 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        { 3463, 3464, 3465, 3466, 3467, 3468 }, -- opt vµng

        --- opt 2
        { 3476, 3477, 3478 }, -- opt vµng

        --- opt 3-1
        { 3488, 3489, 3490, 3491 }, -- opt vµng
    },
};

g8_BadgeDialog_2 = {
    baseAttr = {
        { { 3416, 3417 }, { 3429, 3430, 3431, 3432, 3433 }, { 3445, 3446, 3447, 3448, 3449 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        { 3463, 3464, 3465, 3466, 3467, 3468 }, -- opt vµng

        --- opt 2
        { 3476, 3477, 3478 }, -- opt vµng

        --- opt 3-2
        { 3488, 3489, 3490, 3491 }, -- opt vµng
    },
};

g8_FootDialog_2 = {
    baseAttr = {
        { { 3416, 3417 }, { 3429, 3430, 3431, 3432, 3433 }, { 3445, 3446, 3447, 3448, 3449 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        { 3463, 3464, 3465, 3466, 3467, 3468 }, -- opt vµng

        --- opt 2
        { 3476, 3477, 3478 }, -- opt vµng

        --- opt 3-3
        { 3501, 3502, 3503, 3504 }, -- opt vµng
    },
};
----------------------------------------------------------------------------------------------------
g8_CapeDialog_3 = {
    baseAttr = {
        { { 3510, 3511 }, { 3523, 3524, 3525, 3526, 3527 }, { 3539, 3540, 3541, 3542, 3543 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        { 3557, 3558, 3559, 3560, 3561, 3562 }, -- opt vµng

        --- opt 2
        { 3570, 3571, 3572 }, -- opt vµng

        --- opt 3-1
        { 3582, 3583, 3584, 3585 }, -- opt vµng
    },
};

g8_BadgeDialog_3 = {
    baseAttr = {
        { { 3510, 3511 }, { 3523, 3524, 3525, 3526, 3527 }, { 3539, 3540, 3541, 3542, 3543 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        { 3557, 3558, 3559, 3560, 3561, 3562 }, -- opt vµng

        --- opt 2
        { 3570, 3571, 3572 }, -- opt vµng

        --- opt 3-1
        { 3582, 3583, 3584, 3585 }, -- opt vµng
    },
};

g8_FootDialog_3 = {
    baseAttr = {
        { { 3510, 3511}, { 3523, 3524, 3525, 3526, 3527 }, { 3539, 3540, 3541, 3542, 3543 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        { 3557, 3558, 3559, 3560, 3561, 3562 }, -- opt vµng

        --- opt 2
        { 3570, 3571, 3572 }, -- opt vµng

        --- opt 3-3
        { 3597, 3598, 3599, 3600, 3601 }, -- opt vµng
    },
};
-------------Kim Xµ 9----------------------------------------------------------------
g9_CapeDialog_1 = {
    baseAttr = {
        --{ { 2510, 2511 }, { 2517, 2518, 2519, 2520, 2521 }, { 2533, 2534, 2535, 2536, 2537 } }, -- opt xanh
        --{ { 2512, 2513 }, { 2522, 2523, 2524, 2525, 2526 }, { 2538, 2539, 2540, 2541, 2542 } }, -- opt t›m
        { { 3706, 3707 }, { 3719, 3720, 3721, 3722, 3723 }, { 3736, 3737, 3738, 3739, 3735 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2549, 2550, 2551, 2552, 2554, 2554 }, -- opt xanh
        --{ 2555, 2556, 2557, 2558, 2559, 2560 }, -- opt t›m
        { 3753, 3754, 3755, 3756, 3757, 3758 }, -- opt vµng

        --- opt 2
        --{ 2568, 2569 }, -- opt xanh
        --{ 2570, 2571 }, -- opt t›m
        { 3768, 3769,3770,3771 }, -- opt vµng

        --- opt 3-1
        --{ 2575, 2576, 2577, 2578 }, -- opt xanh
        --{ 2579, 2580, 2581, 2582 }, -- opt t›m
        { 3781, 3782, 3783, 3784 }, -- opt vµng
    },
};

g9_BadgeDialog_1 = {
    baseAttr = {
        --{ { 2510, 2511 }, { 2517, 2518, 2519, 2520, 2521 }, { 2533, 2534, 2535, 2536, 2537 } }, -- opt xanh
        --{ { 2512, 2513 }, { 2522, 2523, 2524, 2525, 2526 }, { 2538, 2539, 2540, 2541, 2542 } }, -- opt t›m
        { { 3706, 3707 }, { 3719, 3720, 3721, 3722, 3723 }, { 3736, 3737, 3738, 3739, 3735 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2549, 2550, 2551, 2552, 2554, 2554 }, -- opt xanh
        --{ 2555, 2556, 2557, 2558, 2559, 2560 }, -- opt t›m
        { 3753, 3754, 3755, 3756, 3757, 3758 }, -- opt vµng

        --- opt 2
        --{ 2568, 2569 }, -- opt xanh
        --{ 2570, 2571 }, -- opt t›m
        { 3768, 3769,3770,3771 }, -- opt vµng

        --- opt 3-2
        --{ 2588, 2589, 2590 }, -- opt xanh
        --{ 2591, 2592, 2593 }, -- opt t›m
        { 3792,3793, 3794 }, -- opt vµng
    },
};

g9_FootDialog_1 = {
    baseAttr = {
        --{ { 2510, 2511 }, { 2517, 2518, 2519, 2520, 2521 }, { 2533, 2534, 2535, 2536, 2537 } }, -- opt xanh
        --{ { 2512, 2513 }, { 2522, 2523, 2524, 2525, 2526 }, { 2538, 2539, 2540, 2541, 2542 } }, -- opt t›m
        { { 3706, 3707 }, { 3719, 3720, 3721, 3722, 3723 }, { 3736, 3737, 3738, 3739, 3735 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2549, 2550, 2551, 2552, 2554, 2554 }, -- opt xanh
        --{ 2555, 2556, 2557, 2558, 2559, 2560 }, -- opt t›m
        { 3753, 3754, 3755, 3756, 3757, 3758 }, -- opt vµng

        --- opt 2
        --{ 2568, 2569 }, -- opt xanh
        --{ 2570, 2571 }, -- opt t›m
        { 3768, 3769,3770,3771 }, -- opt vµng

        --- opt 3-3
        --{ 2598, 2599, 2600, 2601, 2602 }, -- opt xanh
        --{ 2603, 2604, 2605, 2606, 2607 }, -- opt t›m
        { 3806, 3807, 3808, 3809, 3810 }, -- opt vµng
    },
};
----------------------------------------------------------------------------------------------------
g9_CapeDialog_2 = {
    baseAttr = {
        --{ { 2614, 2615 }, { 2621, 2622, 2623, 2624, 2625 }, { 2637, 2638, 2639, 2640, 2641 } }, -- opt xanh
        --{ { 2616, 2617 }, { 2626, 2627, 2628, 2629, 2630 }, { 2642, 2643, 2644, 2645, 2646 } }, -- opt t›m
        { { 3816, 3817 }, { 3829, 3830, 3831, 3832, 3833 }, { 3845, 3846, 3847, 3848, 3849 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2653, 2654, 2655, 2656, 2657, 2658 }, -- opt xanh
        --{ 2659, 2660, 2661, 2662, 2663, 2664 }, -- opt t›m
        { 3863, 3864, 3865, 3866, 3867,3868 }, -- opt vµng

        --- opt 2
        --{ 2672, 2673, 2674 }, -- opt xanh
        --{ 2675, 2676, 2677 }, -- opt t›m
        { 3880, 3881, 3882,3883,3884 }, -- opt vµng

        --- opt 3-1
        --{ 2682, 2683, 2684, 2685 }, -- opt xanh
        --{ 2686, 2687, 2688, 2689 }, -- opt t›m
        { 3894, 3895, 3896, 3897 }, -- opt vµng
    },
};

g9_BadgeDialog_2 = {
    baseAttr = {
        --{ { 2614, 2615 }, { 2621, 2622, 2623, 2624, 2625 }, { 2637, 2638, 2639, 2640, 2641 } }, -- opt xanh
        --{ { 2616, 2617 }, { 2626, 2627, 2628, 2629, 2630 }, { 2642, 2643, 2644, 2645, 2646 } }, -- opt t›m
        { { 3816, 3817 }, { 3829, 3830, 3831, 3832, 3833 }, { 3845, 3846, 3847, 3848, 3849 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2653, 2654, 2655, 2656, 2657, 2658 }, -- opt xanh
        --{ 2659, 2660, 2661, 2662, 2663, 2664 }, -- opt t›m
        { 3863, 3864, 3865, 3866, 3867,3868 }, -- opt vµng

        --- opt 2
        --{ 2672, 2673, 2674 }, -- opt xanh
        --{ 2675, 2676, 2677 }, -- opt t›m
        { 3880, 3881, 3882,3883,3884 }, -- opt vµng

        --- opt 3-2
        --{ 2682, 2683, 2684, 2685 }, -- opt xanh
        --{ 2686, 2687, 2688, 2689 }, -- opt t›m
        { 3894, 3895, 3896, 3897 }, -- opt vµng
    },
};

g9_FootDialog_2 = {
    baseAttr = {
        --{ { 2614, 2615 }, { 2621, 2622, 2623, 2624, 2625 }, { 2637, 2638, 2639, 2640, 2641 } }, -- opt xanh
        --{ { 2616, 2617 }, { 2626, 2627, 2628, 2629, 2630 }, { 2642, 2643, 2644, 2645, 2646 } }, -- opt t›m
        { { 3816, 3817 }, { 3829, 3830, 3831, 3832, 3833 }, { 3845, 3846, 3847, 3848, 3849 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2653, 2654, 2655, 2656, 2657, 2658 }, -- opt xanh
        --{ 2659, 2660, 2661, 2662, 2663, 2664 }, -- opt t›m
        { 3863, 3864, 3865, 3866, 3867,3868 }, -- opt vµng

        --- opt 2
        --{ 2672, 2673, 2674 }, -- opt xanh
        --{ 2675, 2676, 2677 }, -- opt t›m
        { 3880, 3881, 3882,3883,3884 }, -- opt vµng

        --- opt 3-3
        --{ 2695, 2696, 2697, 2698 }, -- opt xanh
        --{ 2699, 2700, 2701, 2702 }, -- opt t›m
        { 3907, 3908, 3909, 3910 }, -- opt vµng
    },
};
----------------------------------------------------------------------------------------------------
g9_CapeDialog_3 = {
    baseAttr = {
        --{ { 2708, 2709 }, { 2715, 2716, 2717, 2718, 2719 }, { 2731, 2732, 2733, 2734, 2735 } }, -- opt xanh
        --{ { 2710, 2711 }, { 2720, 2721, 2722, 2723, 2724 }, { 2736, 2737, 2738, 2739, 2740 } }, -- opt t›m
        { { 3916, 3917 }, { 3929, 3930, 3931, 3932, 3933 }, { 3945, 3946, 3947, 3948, 3949 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2747, 2748, 2749, 2750, 2751, 2752 }, -- opt xanh
        --{ 2753, 2754, 2755, 2756, 2757, 2758 }, -- opt t›m
        { 3963, 3964, 3965, 3966, 3967, 3968 }, -- opt vµng

        --- opt 2
        --{ 2766, 2767, 2768 }, -- opt xanh
        --{ 2769, 2770, 2771 }, -- opt t›m
        { 3980, 3981, 3982,3983,3984 }, -- opt vµng

        --- opt 3-1
        --{ 2776, 2777, 2778, 2779 }, -- opt xanh
        --{ 2780, 2781, 2782, 2783 }, -- opt t›m
        { 3994, 3995, 3996, 3997 }, -- opt vµng
    },
};

g9_BadgeDialog_3 = {
    baseAttr = {
        --{ { 2708, 2709 }, { 2715, 2716, 2717, 2718, 2719 }, { 2731, 2732, 2733, 2734, 2735 } }, -- opt xanh
        --{ { 2710, 2711 }, { 2720, 2721, 2722, 2723, 2724 }, { 2736, 2737, 2738, 2739, 2740 } }, -- opt t›m
        { { 3916, 3917 }, { 3929, 3930, 3931, 3932, 3933 }, { 3945, 3946, 3947, 3948, 3949 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2747, 2748, 2749, 2750, 2751, 2752 }, -- opt xanh
        --{ 2753, 2754, 2755, 2756, 2757, 2758 }, -- opt t›m
        { 3963, 3964, 3965, 3966, 3967, 3968 }, -- opt vµng

        --- opt 2
        --{ 2766, 2767, 2768 }, -- opt xanh
        --{ 2769, 2770, 2771 }, -- opt t›m
        { 3980, 3981, 3982,3983,3984 }, -- opt vµng

        --- opt 3-2
        --{ 2776, 2777, 2778, 2779 }, -- opt xanh
        --{ 2780, 2781, 2782, 2783 }, -- opt t›m
        { 3994, 3995, 3996, 3997 }, -- opt vµng
    },
};

g9_FootDialog_3 = {
    baseAttr = {
        --{ { 2708, 2709 }, { 2715, 2716, 2717, 2718, 2719 }, { 2731, 2732, 2733, 2734, 2735 } }, -- opt xanh
        --{ { 2710, 2711 }, { 2720, 2721, 2722, 2723, 2724 }, { 2736, 2737, 2738, 2739, 2740 } }, -- opt t›m
        { { 3916, 3917 }, { 3929, 3930, 3931, 3932, 3933 }, { 3945, 3946, 3947, 3948, 3949 } }, -- opt vµng
    },
    UnLockAttr = {
        --- opt 1
        --{ 2747, 2748, 2749, 2750, 2751, 2752 }, -- opt xanh
        --{ 2753, 2754, 2755, 2756, 2757, 2758 }, -- opt t›m
        { 3963, 3964, 3965, 3966, 3967, 3968 }, -- opt vµng

        --- opt 2
        --{ 2766, 2767, 2768 }, -- opt xanh
        --{ 2769, 2770, 2771 }, -- opt t›m
        { 3980, 3981, 3982,3983,3984 }, -- opt vµng

        --- opt 3-3
        --{ 2789, 2790, 2791, 2792, 2793 }, -- opt xanh
        --{ 2794, 2795, 2796, 2797, 2798 }, -- opt t›m
        { 4009, 4010, 4011, 4012, 4013 }, -- opt vµng
    },
};

-----------------------------------------------------------------------------------------------------

function GetAttrTable(nItem)
    local nP = GetItemParticular(nItem);
    local tItem2Attr = {
        [40099] = g_CapeDialog_1,
        [40100] = g_BadgeDialog_1,
        [40101] = g_FootDialog_1,

        [40102] = g_CapeDialog_2,
        [40103] = g_BadgeDialog_2,
        [40104] = g_FootDialog_2,
        
        [40105] = g_CapeDialog_3,
        [40106] = g_BadgeDialog_3,
        [40107] = g_FootDialog_3,

        [40108] = g8_CapeDialog_1,
        [40109] = g8_BadgeDialog_1,
        [40110] = g8_FootDialog_1,

        [40111] = g8_CapeDialog_2,
        [40112] = g8_BadgeDialog_2,
        [40113] = g8_FootDialog_2,

        [40114] = g8_CapeDialog_3,
        [40115] = g8_BadgeDialog_3,
        [40116] = g8_FootDialog_3,

        [40148] = g9_CapeDialog_1,
        [40149] = g9_BadgeDialog_1,
        [40150] = g9_FootDialog_1,

        [40151] = g9_CapeDialog_2,
        [40152] = g9_BadgeDialog_2,
        [40153] = g9_FootDialog_2,

        [40154] = g9_CapeDialog_3,
        [40155] = g9_BadgeDialog_3,
        [40156] = g9_FootDialog_3,
    }
    return tItem2Attr[nP];
end

function GetAwardTable(nItem)
    local nP = GetItemParticular(nItem);
    local tItemAward = {
        [40099] = { { 0, 152, 35, 1, 4, -1, -1, -1, -1, -1, -1 }, "S∏t Lang Phi Phong" },
        [40100] = { { 0, 153, 35, 1, 4, -1, -1, -1, -1, -1, -1 }, "S∏t Lang Ch≠¨ng" },
        [40101] = { { 0, 154, 35, 1, 4, -1, -1, -1, -1, -1, -1 }, "S∏t Lang Ngoa" },
        
        [40102] = { { 0, 152, 36, 1, 4, -1, -1, -1, -1, -1, -1 }, "Nhu÷ Nha Phi Phong" },
        [40103] = { { 0, 153, 36, 1, 4, -1, -1, -1, -1, -1, -1 }, "Nhu÷ Nha Ch≠¨ng" },
        [40104] = { { 0, 154, 36, 1, 4, -1, -1, -1, -1, -1, -1 }, "Nhu÷ Nha Ngoa" },
        
        [40105] = { { 0, 152, 37, 1, 4, -1, -1, -1, -1, -1, -1 }, "MÈng s∏t Phi Phong" },
        [40106] = { { 0, 153, 37, 1, 4, -1, -1, -1, -1, -1, -1 }, "MÈng s∏t  Ch≠¨ng" },
        [40107] = { { 0, 154, 37, 1, 4, -1, -1, -1, -1, -1, -1 }, "MÈng s∏t  Ngoa" },

        [40108] = { { 0, 152, 38, 1, 4, -1, -1, -1, -1, -1, -1 }, "Tinh huy Phi Phong" },
        [40109] = { { 0, 153, 38, 1, 4, -1, -1, -1, -1, -1, -1 }, "Tinh huy Ch≠¨ng" },
        [40110] = { { 0, 154, 38, 1, 4, -1, -1, -1, -1, -1, -1 }, "Tinh huy Ngoa" },

        [40111] = { { 0, 152, 39, 1, 4, -1, -1, -1, -1, -1, -1 }, "H·a S∏t Phi Phong" },
        [40112] = { { 0, 153, 39, 1, 4, -1, -1, -1, -1, -1, -1 }, "H·a S∏t Ch≠¨ng" },
        [40113] = { { 0, 154, 39, 1, 4, -1, -1, -1, -1, -1, -1 }, "H·a S∏t Ngoa" },

        [40114] = { { 0, 152, 40, 1, 4, -1, -1, -1, -1, -1, -1 }, "Nguyet Khuyet Phi Phong" },
        [40115] = { { 0, 153, 40, 1, 4, -1, -1, -1, -1, -1, -1 }, "Nguyet Khuyet Ch≠¨ng" },
        [40116] = { { 0, 154, 40, 1, 4, -1, -1, -1, -1, -1, -1 }, "Nguyet Khuyet Ngoa" },

        [40148] = { { 0, 152, 41, 1, 4, -1, -1, -1, -1, -1, -1 }, "C´n Bªng Phi Phong" },
        [40149] = { { 0, 153, 41, 1, 4, -1, -1, -1, -1, -1, -1 }, "C´n Bªng Ch≠¨ng" },
        [40150] = { { 0, 154, 41, 1, 4, -1, -1, -1, -1, -1, -1 }, "C´n Bªng Ngoa" },

        [40151] = { { 0, 152, 42, 1, 4, -1, -1, -1, -1, -1, -1 }, "Toan Ngh™ Phi Phong" },
        [40152] = { { 0, 153, 42, 1, 4, -1, -1, -1, -1, -1, -1 }, "Toan Ngh™ Ch≠¨ng" },
        [40153] = { { 0, 154, 42, 1, 4, -1, -1, -1, -1, -1, -1 }, "Toan Ngh™ Giao Ngoa" },

        [40154] = { { 0, 152, 43, 1, 4, -1, -1, -1, -1, -1, -1 }, "ChÛc Long Phi Phong" },
        [40155] = { { 0, 153, 43, 1, 4, -1, -1, -1, -1, -1, -1 }, "ChÛc Long Ch≠¨ng" },
        [40156] = { { 0, 154, 43, 1, 4, -1, -1, -1, -1, -1, -1 }, "ChÛc Long Ngoa" },
    }
    return tItemAward[nP];
end

function GetItemFeedAttrDesc(id)
    if g_FeedItemDesc == WEnv.NULL then
        g_ItemFeedDesc = {};
    end
    if g_ItemFeedDesc[id] == WEnv.NULL then
        local itemDesc = GetItemFeedAttiDesc(id);
        itemDesc = sf_Replace(itemDesc, "<enter>", ", ")
        itemDesc = sf_RemoveTag(itemDesc, "<", ">")
        g_ItemFeedDesc[id] = itemDesc

    end
    return g_ItemFeedDesc[id];
end

function ComposeFeedItem(nItem, nLineID)
    if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
        return 0;
    end
    local szItemName = GetItemName(nItem);
    local nLockSaved = 1;
    if GetItemSpecialAttr(nItem, "BIND") == 1 then
        nLockSaved = 4;
    end
    --local nEnhanceSaved = GetEquipAttr(nItem, 2);
    local nEnhanceSaved = 15
    if DelItemByIndex(nItem, 1) ~= 1 then
        return 0;
    end
    local szName = GetName();
    local tRet = GetAwardTable(nItem);
    if nLineID then
        tRet = tRet[1][nLineID];
    end
    local tLineID = tempLineID[szName];
    --tRet[1][4] = nLockSaved;
    if tRet[1][2] ~= 102 and (nEnhanceSaved >= 0 and nEnhanceSaved <= 15) then
        tRet[1][13] = nEnhanceSaved;
    end
    local nRet, nItemIdx = gf_AddItemEx2(tRet[1], tRet[2], szItemName, tRet[2], 0, 1);
    if nItemIdx then
        SetItemFeedUpAttrs(nItemIdx, tLineID[1], tLineID[2], tLineID[3], tLineID[4], tLineID[5], tLineID[6]);
        --WDebug:Log(szItemName, tRet[2], format("Index:%d LineID:%d|%d|%d|%d|%d|%d", nItemIdx, tLineID[1], tLineID[2], tLineID[3], tLineID[4], tLineID[5], tLineID[6]));

        WPlayerLog:WriteAddItemLog("item_chon_phahon_giucuonghoa", "MÎ l÷nh bµi", nRet, nItemIdx, tRet[1][4], tLineID);
    end
end

--—°‘ÒΩ‚À¯ Ù–‘
function ChoiceUnLockAttr(nItem, nLineID)
    local szName = GetName();
    local tDialog = GetAttrTable(nItem);
    local tLineID = tempLineID[szName];
    if nLineID and getn(tLineID) < 6 then
        tLineID[getn(tLineID) + 1] = nLineID;
        nLineID = WEnv.NULL
    end
    if getn(tLineID) < 6 then
        local nIndex = getn(tLineID) - 2;
        local unlock = tDialog.UnLockAttr;
        local tCurrList = unlock[nIndex];
        local tbSay = {};
        local tName = { "thuÈc t›nh con mÎ kho∏ 1", "thuÈc t›nh con mÎ kho∏ 2", "thuÈc t›nh con mÎ kho∏ 3" };
        tbSay.msg = format("l˘a ch‰n %s:", tName[nIndex]);
        tbSay.sel = {};
        for i = 1, getn(tCurrList) do
            tinsert(tbSay.sel, { GetItemFeedAttrDesc(tCurrList[i]), format("#ChoiceUnLockAttr(%d, %d)", nItem, tCurrList[i]) });
        end
        tinsert(tbSay.sel, { "\n rÛt lui", "nothing" });
        temp_Talk(tbSay);
        return 0;
    end
    --◊Ó∫Ûµƒ»∑»œ
    local tRet = GetAwardTable(nItem);
    if nLineID == WEnv.NULL and type(tRet[1][1]) == "table" then
        local tbSay = {};
        tbSay.msg = format("H∑y ch‰n loπi cÒa %s: ", tRet[2]);
        tbSay.sel = {};
        local nPlayerRoute = GetPlayerRoute();
        local nDetectRoute = 0;
        for i = 1, getn(tRet[1]) do
            if tRet[1][i][3] == WEnv.NULL or (type(tRet[1][i][3]) == "number" and tRet[1][i][3] == nPlayerRoute) then
                tinsert(tbSay.sel, { tRet[1][i][2],
                                     format("#ChoiceUnLockAttr(%d, %d)", nItem, i) });
                if type(tRet[1][i][3]) == "number" and tRet[1][i][3] == nPlayerRoute then
                    nDetectRoute = i;
                    break ;
                end
            end
        end
        if nDetectRoute ~= 0 then
            ChoiceUnLockAttr(nItem, nDetectRoute);
            return 0;
        end
        tinsert(tbSay.sel, { "\n rÛt lui", "nothing" });
        temp_Talk(tbSay);
        return 0;
    end
    local szDialog = format("ßÂng ˝/#ComposeFeedItem(%d)", nItem);
    if nLineID and type(tRet[1][1]) == "table" then
        tRet = tRet[1][nLineID]
        szDialog = format("ßÂng ˝/#ComposeFeedItem(%d, %d)", nItem, nLineID);
    end
    local msg = "ThuÈc t›nh l˘a ch‰n cuËi cÔng nh≠ sau:\n";
    msg = msg .. format("ThuÈc t›nh m∆c Æﬁnh: \n<color=green>%s, %s, %s<color>\n", GetItemFeedAttrDesc(tLineID[1]), GetItemFeedAttrDesc(tLineID[2]), GetItemFeedAttrDesc(tLineID[3]));
    msg = msg .. format("ThuÈc t›nh mÎ kh„a:  \n<color=green>%s, %s, %s<color>\n", GetItemFeedAttrDesc(tLineID[4]), GetItemFeedAttrDesc(tLineID[5]), GetItemFeedAttrDesc(tLineID[6]));
    msg = msg .. format("Quy’t Æﬁnh dÔng <color=gold>%s<color> gh–p thµnh <color=gold>%s<color> kh´ng?", GetItemName(nItem), tRet[2]);
    Say(msg, 2, szDialog, "ß” ta suy ngh‹/nothing");
end

--—°‘Òª˘¥° Ù–‘
function ChoiceBaseAttr(nItem, choice1, curIndex, choice2)
    local szName = GetName();
    local tDialog = GetAttrTable(nItem);
    local base = tDialog.baseAttr;
    if choice1 == WEnv.NULL and getn(base) ~= 1 then
        local tSay = {};
        for k, v in base do
            tinsert(tSay, format("%s/#ChoiceBaseAttr(%d, %q)", k, nItem, k));
        end
        tinsert(tSay, "\n rÛt lui/nothing");
        Say("H∑y ch‰n loπi thuÈc t›nh c¨ b∂n: ", getn(tSay), tSay);
        return 0;
    end
    if choice1 == WEnv.NULL then
        choice1 = 1;
    end
    local tLineID = tempLineID[szName];
    local tBaseAttr = tDialog.baseAttr[choice1];
    if choice2 then
        tLineID[curIndex] = tBaseAttr[curIndex][choice2];
        choice2 = WEnv.NULL;
    end
    if curIndex == WEnv.NULL then
        curIndex = 0;
    end
    
    for i = curIndex + 1, getn(tBaseAttr) do
        if choice2 == WEnv.NULL and type(tBaseAttr[i]) == "table" then
            local tSay = {}
            for j = 1, getn(tBaseAttr[i]) do
                local szFormat = "%s/#ChoiceBaseAttr(%d, %q, %d, %d)";
                if type(choice1) == "number" then
                    szFormat = "%s/#ChoiceBaseAttr(%d, %d, %d, %d)";
                end
                tinsert(tSay, format(szFormat, GetItemFeedAttrDesc(tBaseAttr[i][j]), nItem, choice1, i, j));
            end
            tinsert(tSay, "\n rÛt lui/nothing");
            Say("H∑y ch‰n loπi thuÈc t›nh con c¨ b∂n: ", getn(tSay), tSay);
            return 0;
        end
        tLineID[i] = tBaseAttr[i];
    end
    ChoiceUnLockAttr(nItem);
end

function OnUseItem(nItem)
    if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
        return 0;
    end
    if gf_Check55FullSkill() ~= 1 then
        Talk(1, "", "Gia nhÀp l≠u ph∏i vµ h‰c k¸ n®ng c p 55 mÌi Æ≠Óc dÔng!");
        return 0;
    end
    if tempLineID == WEnv.NULL then
        tempLineID = {};
    end
    local szName = GetName();
    tempLineID[szName] = {};
    ChoiceBaseAttr(nItem);
end

function OnUse(nItem)
    local szItemName = GetItemName(nItem);
    local szAwardName = GetAwardTable(nItem)[2];
    local tbAwardInfo = GetAwardTable(nItem)[1];
    local nEnhanceSaved = GetEquipAttr(nItem, 2);
    if (type(tbAwardInfo[1]) == "number" and tbAwardInfo[2] ~= 102 and (nEnhanceSaved >= 0 and nEnhanceSaved <= 15))
            or (type(tbAwardInfo[1]) == "table" and tbAwardInfo[1][1][2] ~= 102 and (nEnhanceSaved >= 0 and nEnhanceSaved <= 15))
    then
        Say(format("sˆ dÙng <color=gold>%s<color> c„ th” hÓp thµnh <color=gold>%s+%d<color>, x∏c nhÀn sˆ dÙng kh´ng?", szItemName, szAwardName, 15), 2,
                format("\nßÂng ˝ dÔng/#OnUseItem(%d)", nItem), "\nß” ta suy ngh‹ lπi/nothing");
    else
        Say(format("sˆ dÙng <color=gold>%s<color> c„ th” hÓp thµnh <color=gold>%s<color>, x∏c nhÀn sˆ dÙng kh´ng?", szItemName, szAwardName), 2,
                format("\nßÂng ˝ dÔng/#OnUseItem(%d)", nItem), "\nß” ta suy ngh‹ lπi/nothing");
    end
end
