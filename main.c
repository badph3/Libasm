#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <fcntl.h>

void test_strlen()
{
    printf("---- STRLEN ----\n");
    printf("strlen: %zu\n", strlen("hello"));
    printf("ft_strlen: %zu\n", ft_strlen("hello"));
}

void test_strcpy()
{
    char dst1[50];
    char dst2[50];

    strcpy(dst1, "hello world");
    ft_strcpy(dst2, "hello world");

    printf("---- STRCPY ----\n");
    printf("strcpy: %s\n", dst1);
    printf("ft_strcpy: %s\n", dst2);
}

void test_strcmp()
{
    printf("---- STRCMP ----\n");
    printf("strcmp: %d\n", strcmp("abc", "abd"));
    printf("ft_strcmp: %d\n", ft_strcmp("abc", "abd"));
}

void test_write()
{
    printf("---- WRITE ----\n");
    write(1, "write\n", 6);
    ft_write(1, "ft_write\n", 9);
}

void test_read()
{
    char buf[100];
    int fd = open("txt.txt", O_RDONLY);

    read(fd, buf, 5);
    buf[5] = 0;
    printf("read: %s\n", buf);

    lseek(fd, 0, SEEK_SET);

    ft_read(fd, buf, 5);
    buf[5] = 0;
    printf("ft_read: %s\n", buf);

    close(fd);
}

void test_strdup()
{
    char *s1 = strdup("hello");
    char *s2 = ft_strdup("hello");

    printf("---- STRDUP ----\n");
    printf("strdup: %s\n", s1);
    printf("ft_strdup: %s\n", s2);

    free(s1);
    free(s2);
}

int main()
{
    test_strlen();
    test_strcpy();
    test_strcmp();
    test_write();
    test_read();
    test_strdup();
}