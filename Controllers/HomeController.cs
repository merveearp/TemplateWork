using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;


namespace TemplateWork.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

}
