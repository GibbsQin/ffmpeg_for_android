如果拿到的工程文件中，没有Makefile文件，而只有configure.in和Makefile.am文件，我们是不能够直接进行编译的，必须在UBUNTU等Linux系统下，根据configure.in和Makefile.am文件生成编译所需的Makefile文件。具体操作步骤如下：
1、执行autoscan，然后执行aclocal，产生aclocal.m4文件
aclocal是一个perl 脚本程序，它的定义是：“aclocal – create aclocal.m4 by scanning configure.ac”。 aclocal根据configure.in文件的内容，自动生成aclocal.m4文件。而aclocal.m4文件中，包含了生成configure文件所必须的宏。
2、执行autoconf，autoreconf -i，生成configure文件
autoconf会根据configure.in和aclocal.m4文件，生成configure文件。其实，autoconf就是把configure.in和aclocal.m4文件中定义的内容， 变成检查系统特性、环境变量、软件必须的参数的shell脚本。
3、执行automake命令，产生Makefile.in
具体命令为：automake –add-missing
automake会根据Makefile.am文件产生一些文件，包含最重要的Makefile.in。前面所生成的configure，会根据Makefile.in文件，来生成最终的Makefile文件。
4、执行configure命令，生成Makefile文件
这样，就产生了编译所需要的Makefile文件。运行make，即可编译。