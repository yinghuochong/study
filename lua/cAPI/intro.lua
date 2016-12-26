Lua 和 C 通信的主要方法是一个无所不在的虚拟栈，
1、几乎所有的API调用都会操作这个栈上的值。
2、所有的数据交换，无论是Lua到C 还是 C到Lua 都通过这个栈来完成
3、这个栈还可以用来保存一些中间结果
栈 可以解决Lua和C 语言之间存在的两大差异，
1、Lua使用垃圾收集  C使用显式的释放内存
2、Lua使用动态类型，C使用静态类型



void lua_call (lua_State *L, int nargs, int nresults);
1、调用一个函数
2、被调用的函数必须已经被push到栈，参数也按正确的熟悉被push，第一个参数第一个被push
3、nargs 参数数量  函数被调用时 所有的参数 和  函数背身都会从栈里 pop 出来
4、nresults 是返回值数量  所有的返回值都会被push到栈， 第一个结果第一个被push，执行完这个函数，栈顶应该是最后一个结果

a = f("how", t.x, 14)

     lua_getfield(L, LUA_GLOBALSINDEX, "f"); 		/* 函数被调用 */
     lua_pushstring(L, "how");                        /* 第一个参数 */
     lua_getfield(L, LUA_GLOBALSINDEX, "t");   		/* 索引一个表 */
     lua_getfield(L, -1, "x");        /* push t.x到栈 (第二个参数) */
     lua_remove(L, -2);                  /* 从栈里移出 't' */
     lua_pushinteger(L, 14);                          /* 第三个参数 */
     lua_call(L, 3, 1);     /* 使用3个参数1个返回值 调用f  */
     lua_setfield(L, LUA_GLOBALSINDEX, "a");        /* 设置 'a' */

10


int lua_pcall (lua_State *L, int nargs, int nresults, int errfunc);
1、不发生错误时和 lua_call 一样
2、发生错误 会push一个error message 到栈，并且返回一个错误码，同样也会从栈里清除函数和参数