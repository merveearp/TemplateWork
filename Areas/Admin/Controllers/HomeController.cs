using Microsoft.AspNetCore.Mvc;

namespace TemplateWork.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : Controller
    {
    
        public ActionResult Index()
        {
            return View();
        }

    }
}
