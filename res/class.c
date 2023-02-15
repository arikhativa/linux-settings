/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   class.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yrabby <yrabby@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/18 14:00:59 by yrabby            #+#    #+#             */
/*   Updated: 2023/02/15 13:37:33 by yrabby           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "Replace.h"

t_error_code	Replace_create(t_Replace **ret)
{
	if (ret)
	{
		*ret = (t_Replace *)ft_calloc(1, sizeof(t_Replace));
		if (!*ret)
			return (ERROR);
		return (SUCCESS);
	}
	return (ERROR);
}

void	Replace_destroy(t_Replace **obj)
{
	t_Replace	*tmp;

	if (obj && *obj)
	{
		tmp = *obj;
		ft_bzero(tmp, sizeof(t_Replace));
		free(tmp);
		*obj = NULL;
	}
}
