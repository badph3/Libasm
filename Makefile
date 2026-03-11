NAME = libasm.a

NASM = nasm
NASMFLAGS = -f elf64

CC = gcc
CFLAGS = -Wall -Wextra -Werror -Iincludes

SRC_DIR = src
SRC = $(SRC_DIR)/ft_strlen.s \
      $(SRC_DIR)/ft_strcpy.s \
      $(SRC_DIR)/ft_strcmp.s \
      $(SRC_DIR)/ft_write.s \
      $(SRC_DIR)/ft_read.s \
      $(SRC_DIR)/ft_strdup.s

OBJ = $(SRC:.s=.o)

MAIN = main.c
TEST = test_libasm

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

$(SRC_DIR)/%.o: $(SRC_DIR)/%.s
	$(NASM) $(NASMFLAGS) $< -o $@

$(TEST): $(NAME) $(MAIN)
	$(CC) $(CFLAGS) $(MAIN) $(NAME) -o $(TEST)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) $(TEST)

re: fclean all

test: $(TEST)

.PHONY: all clean fclean re test