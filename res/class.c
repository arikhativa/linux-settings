/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   class.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yrabby <yrabby@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/18 14:00:59 by yrabby            #+#    #+#             */
/*   Updated: 2023/02/13 12:09:14 by yrabby           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "Replace.h"

t_Replace	*Replace_create(void)
{
	t_Replace	*ret;

	ret = (t_Replace *)ft_calloc(1, sizeof(t_Replace));
	if (!ret)
		return (NULL);
	return (ret);
}

void	Replace_destroy(t_Replace *obj)
{
	bzero(obj, sizeof(t_Replace));
	free(obj);
}
