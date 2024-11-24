using System;
using Microsoft.AspNetCore.Mvc;

namespace TemplateWork.Areas.Admin.ViewComponents;

public class UserViewComponent:ViewComponent
{
    public async Task<IViewComponentResult> InvokeAsync()
    {
        return View();
    }
}
