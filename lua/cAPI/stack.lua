1、动态类型 静态类型
2、自动内存 手动内存

a[k] = v 
k和v可以是任意类型，甚至a也有可能是其他类型，因为可以通过元表重载操作符。
假设要在C中提供一个API函数 settable ,
由于C是固定类型，所以必须为各种类型编写重载函数

void lua_settable(lua_Value a, lua_Value k, lua_Value v)  --可以在C中声明 union 类型lua_Value
1、很难将这种复杂类型映射到其他语言，Lua的设计目标不仅为了方便 C/C++访问，还应该可以被 Java 、C#等其他语言访问
2、lua是垃圾回收机制，如果将Lua table放在C变量中，Lua引擎无法搜索出，因此，它会认为table是垃圾文件并回收它

基于此，Lua API 使用了抽象的栈，在Lua和C之间交换数据
栈中每个元素都能保存任何类型的Lua值，
要想获取Lua中的一个值时，只要调用一个Lua API，Lua就会将指定的值压入栈中
要想传一个值给Lua,先将这个值压入栈，再调用Lua API,Lua就会获取该值，并将其从栈中弹出
为了将C类型的值压入栈，或者从栈中获取不同类型的值，就需要为每种类型定义一个特定函数，但这种定义的数量远小玉settable重载的数量
这个栈是由 Lua来管理的，垃圾收集器就能确定C使用了哪些值

-- 压入元素 
每种在Lua中的C类型， API都有一个对应的压入函数  lua_push*
void  (lua_pushnil) (lua_State *L);
void  (lua_pushnumber) (lua_State *L, lua_Number n); --lua_Number 双精度浮点数
void  (lua_pushinteger) (lua_State *L, lua_Integer n);
void  (lua_pushboolean) (lua_State *L, int b);
void  (lua_pushlstring) (lua_State *L, const char *s, size_t l);
void  (lua_pushstring) (lua_State *L, const char *s);
Lua不会持有指向外部字符串的指针，所有的Lua持有的字符串都会生成副本，或者复用现有内容

向栈中push元素时，应确保栈有足够的空间，Lua启动时或Lua调用C时，栈中至少会有20个空闲，一般足够
有些任务需要更多的栈需要调用 来检查栈中是否有足够的空间
int lua_checkstack(lua_State *L, int sz)

-- 查询元素
API使用 “索引”来引用栈中的元素，第一个压入的索引为1；第二个为2，依次类推
还可以以栈顶为参考，使用负数来访问栈中的元素，-1表示栈顶元素 ，-2表示栈顶下面的元素，依次类推
如， lua_tostring(L,-1),会将栈顶的值作为一个字符串返回
--检查元素
为了检查一个元素是否为特定类型，API提供了一系列的函数 lua_is*
lua_isnil
lua_isboolean
lua_isnumber
lua_isstring
lua_istable
lua_isthread
lua_isfunction
lua_iscfunction
lua_isuserdata

lua_isnumber 不会检查值是否为数字类型，而是检查值是否能转换为数字类型
lua_isstring 也有同样的行为，因此对于任意数字，lua_isstring都返回真
还有一个函数lua_type,返回栈中元素的类型，每种类型都对应一个常量，可以用来检查一个元素是否为真正的数字或字符串
#define LUA_TNONE		(-1)

#define LUA_TNIL		0
#define LUA_TBOOLEAN		1
#define LUA_TLIGHTUSERDATA	2
#define LUA_TNUMBER		3
#define LUA_TSTRING		4
#define LUA_TTABLE		5
#define LUA_TFUNCTION		6
#define LUA_TUSERDATA		7
#define LUA_TTHREAD		8

-- 获取元素  
lua_to*
如果指定的元素不具有正确的类型，调用这些函数也不会有问题
lua_toboolean 、lua_tonumber、 lua_tointeger 、lua_objlen 会返回0,其余返回NULL
返回NULL的这些，可以先不适用lua_is*来检查，只用检查返回值就行了

所有lua_tolstring返回的字符串末尾都会有一个额外的0，不过这些串中间也可能有0，
字符串的长度通过第三个参数len来返回，这个才是真正的字符串长度
size_t l;
const char* s = lua_tolstring(L,-1,&l)
assert(s[l] == "\0")
assert(strlen(s) <= l)

lua_objlen 返回一个对象的长度，对于串和table 是长度操作符 # ，还可以用于获取userdata的大小


-- 其他栈操作
int lua_gettop(lua_State *L);  -- 返回栈中元素个数 ，也可以说是栈顶元素的索引
void lua_settop(lua_State *L, int index); -- 修改栈中元素的数量 ,多的丢弃，缺的用nil补  lua_settop(L,0)清空栈

void lua_pushvalue(lua_State *L, int index); -- 将指定索引上的副本 压入栈
void lua_remove(lua_State *L, int index);    -- 删除指定索引上的元素，该位置之上的所有元素下移
void lua_insert(lua_State *L, int index);	 -- 上移指定位置之上的所有元素，以开辟一个槽的空间，然后将栈顶元素移到该位置
void lua_replace(lua_State *L, int index);	 -- 弹出栈顶的值，并将该值设置到指定索引，不会移动任何东西







































