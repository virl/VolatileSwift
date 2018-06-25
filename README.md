# VolatileSwift
Swift crash due to memory corruption on property assignment.

Crashes with EXC_BAD_ACCESS after minute run on multicore system:

```
VolatileSwift(44779,0x70000b624000) malloc: *** error for object 0x10303d2a0: double free
*** set a breakpoint in malloc_error_break to debug
VolatileSwift(44779,0x700002347000) malloc: *** error for object 0x10303d270: double free
*** set a breakpoint in malloc_error_break to debug
VolatileSwift(44779,0x700026aa3000) malloc: *** error for object 0x10303d210: pointer being freed was not allocated
*** set a breakpoint in malloc_error_break to debug
```

In contrast with desktop Java, that doesn't crash on setting object properties from multiple threads.

Due to that, Swift is unsuitable for any serious server-side, driver or networking development.