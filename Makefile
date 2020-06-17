BUILD_DIR := build

default: jlox_repl

generate_ast:
	@ $(MAKE) -f util/java.make DIR=src PACKAGE=tool
	@ java -cp build/src com.tool.GenerateAst \
			src/com/lox

# Compile the Java interpreter .java files to .class files.
jlox: generate_ast
	@ $(MAKE) -f util/java.make DIR=src PACKAGE=lox

jlox_repl: jlox
	@ (pwd && java -cp build/src com.lox.Lox)

run: jlox
	@ (pwd && java -cp build/src com.lox.Lox main.lx)

clean:
	@ rm -rf $(BUILD_DIR)
	@ rm -rf gen

.PHONY: jlox_run jlox generate_ast clean
