﻿using DTO.DTOModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interface
{
    public interface IAccountRepository
    {
        Task<SingleReturnResult<string>> Register(UserMasterModel userDetails);
        Task<SingleReturnResult<ResponseDto>> Login(LoginDto loginDetails);
        Task<ListReturnResult<MenuListDto>> GetMenuByRoleId(int roleId);
        Task<ListReturnResult<UserMasterModel>> GetUsers();
        Task<SingleReturnResult<UserMasterModel>> GetUserById(long id);
        Task<SingleReturnResult<int>> SetRoleMenuMapping(RoleMenuModel roleMenu);
        Task<ListReturnResult<CommonMasterDto>> getAllRoles();
    }
}
