/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   class.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yrabby <yrabby@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/18 14:00:59 by yrabby            #+#    #+#             */
/*   Updated: 2023/02/15 13:55:57 by yrabby           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "Replace.h"

t_error_code	Replace_create(t_Replace **ret)
{
	t_error_code	err;
	t_Replace		*tmp;

	if (!ret)
		return (ERROR);
	tmp = (t_Replace *)ft_calloc(1, sizeof(t_Replace));
	if (!tmp)
		return (ALLOCATION_ERROR);
	*ret = tmp;
	return (SUCCESS);
}

void	Replace_destroy(t_Replace **obj)
{
	t_Replace	*tmp;

	if (!obj && !*obj)
		return ;
	tmp = *obj;
	ft_bzero(tmp, sizeof(t_Replace));
	free(tmp);
	*obj = NULL;
}
