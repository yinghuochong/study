//
//  main.m
//  LuaC
//
//  Created by liulihua on 16/5/8.
//  Copyright © 2016年 firefly. All rights reserved.
//

#import <stdio.h>
#import <string.h>

#import "lua.h"
#import "lauxlib.h"
#import "lualib.h"

int main(int argc, const char * argv[]) {
    char buff[256];
    int error;
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    while (fgets(buff, sizeof(buff), stdin) != NULL) {
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
