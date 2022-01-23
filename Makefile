CFLAGS = -Iinclude -I/Users/ehasanaj/miniconda3/envs/ml38/include/python3.8 \
-I/Users/ehasanaj/miniconda3/envs/ml38/lib/python3.8/site-packages/numpy/core/include \
-std=c++17 -DDEBUG -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -O2 -Wall
CC = g++
SRC = $(wildcard src/reliefcpp/*.cpp)
SRC := $(filter-out src/reliefcpp/python_interface.cpp, $(SRC))
OBJ = $(SRC:.cpp = .o)

all: TestRelief clean

TestRelief: test_relief.o $(OBJ)
	$(CC) $(CFLAGS) -o test_relief test_relief.o $(OBJ)

test_relief.o:
	$(CC) $(CFLAGS) -c test/test_relief.cpp

clean:
	rm -f *.o