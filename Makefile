BUILD_DIR := build

default: jlox_run

generate_ast:
	@ $(MAKE) -f util/java.make DIR=src PACKAGE=tool
	@ java -cp build/src com.tool.GenerateAst \
			src/com/lox

# Compile the Java interpreter .java files to .class files.
jlox: generate_ast
	@ $(MAKE) -f util/java.make DIR=src PACKAGE=lox

jlox_run: jlox
	@ java -cp build/src com.lox.Lox

clean:
	@ rm -rf $(BUILD_DIR)
	@ rm -rf gen

.PHONY: jlox generate_ast clean
