# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: teliet <teliet@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 20:41:39 by teliet            #+#    #+#              #
#    Updated: 2023/03/03 12:44:05 by teliet           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fractol

SRC = main.c 

CC = gcc

HEADERS = -I ./includes

LFLAGS = -Lmlx_Linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz

LIBS =  

OBJ = $(SRC:.c=.o)

all: ${NAME}
 
$(NAME): $(OBJ) $(LIBS)
	$(CC) $(OBJ) $(LIBS) $(HEADERS) $(LFLAGS) -o $(NAME)
	
debug: clean
	$(CC) $(SRC) $(LIBS) $(HEADERS) $(LFLAGS) -g3 -O3 -o $(NAME) 

%.o: %.c
	$(CC) -Wall -Wextra -Werror $(HEADERS) -I/usr/include -Imlx_linux -O3 -c $< -o $@

clean:
	/bin/rm -f ${OBJ}

fclean: clean
	/bin/rm -f ${NAME}

re: fclean all
