﻿using DTO.DTOModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interface
{
    public interface ITouchUp
    {
        Task<ListReturnResult<AssignedJobDTO>> GetTouchUpAssignedJob();
        Task<ListReturnResult<DiamondDetailDto>> GetStoneForTouchUp(int Id);
        Task<SingleReturnResult<string>> AddTouchUp(TouchUpDto touch);
    }
}
