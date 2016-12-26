//
//  Comments.m
//  LuaC
//
//  Created by liulihua on 16/5/12.
//  Copyright © 2016年 firefly. All rights reserved.
//

#import <stdio.h>
#import <string.h>

#import "lua.h" //定义了Lua提供的基础函数，包括创建Lua环境、调用Lua函数(如lua_pcall)、读写Lua环境中的全局变量，以及注册供Lua调用的新函数等。lua.h中定义的所有内容都有一个lua_前缀。
#import "lauxlib.h"//定义了辅助库提供的函数，所有定义都以luaL_开头。辅助库是一个使用lua.h中API编写出的一个较高的抽象层。Lua中所有的标准库编写都用到了辅助库。基础API的设计保持原子性和正交性，而辅助库则侧重于解决具体的任务。程序若要创建自己的抽象也非常简单。需要注意，辅助库并未直接访问Lua内部，它都是用官方的基础API来完成所有工作的
#import "lualib.h" // 定义了打开lua各个标准库的方法

int main(int argc, const char * argv[]) {
    char buff[256];
    int error;
    //lua 库中没有定义任何全局变量，它将所有的状态都保存在动态结构 lua_State 中，所有的C API都邀请传入一个指向该结构的指针，这种实现使得Lua可以重入(reenter)，稍加修改即可用于多线程的代码中。
    lua_State *L = luaL_newstate();
    //luaL_newstate 函数用于创建一个新的环境（或者叫状态），当luaL_newstate创建一个新的环境时，新环境中没有包含预定义的函数，甚至没有print，为了使Lua保持小巧，所有的标准库都被组织到不同的包中。这样便可以忽略哪些不需要的包，在头文件lualib.h中定义了打开这些库的函数，辅助库中的luaL_openlibs 可以打开所有的标准库
    luaL_openlibs(L);
    //当创建好一个lua环境，并加载了标准库之后，就可以解释用户的输入了
    while (fgets(buff, sizeof(buff), stdin) != NULL) {
        //luaL_loadbuffer 用来编译用户输入的每行的内容，如果没有错误，返回0，并向栈中压入编译后的程序块,函数会自动检测chunk是文本还是二进制，并且正确的加载它，最后一个参数 是chunkname，是错误信息和debug信息用的
        //lua_pcall 会将程序块从栈中弹出，并在保护模式中运行它，与luaL_loadbuffer 类似，返回0表示没有错误
        //若发生错误，这些函数会向栈中压入一条错误消息,用lua_tostring可以获取这条消息，lua_pop可以把它从栈中删除
        
        error = luaL_loadbuffer(L, buff, strlen(buff), "line")
        || lua_pcall(L, 0, 0, 0);
        if (error){
            fprintf(stderr, "%s",lua_tostring(L, -1));
            lua_pop(L, 1);
        }
    }
    lua_close(L);
    return 0;
}
