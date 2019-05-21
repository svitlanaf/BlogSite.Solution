using System.Collections.Generic;
using System;
using Microsoft.AspNetCore.Mvc;
using BlogSite.Models;
using System.Linq;
using MySql.Data.MySqlClient;

namespace BlogSite.Controllers
{
  public class BlogsController : Controller
  {

      [HttpGet("/blogs")]
      public ActionResult Index()
      {
          List<Blog> allBlogs = Blog.GetAll();
          return View(allBlogs);
      }

      [HttpGet("/blogs/new")]
      public ActionResult New()
      {
        return View();
      }

      [HttpPost("/blogs/create")]
      public ActionResult Create(string username, string password1, string password2)
      {
        if(password1 == password2)
        {
          Blog newBlog = new Blog(username, password1);
          newBlog.Save();
          Blog.Login(username, password1);
          return View("Edit", newBlog);
        }
        else
        {
          return View("New");
        }
      }

      [HttpGet("/blogs/{id}/edit")]
      public ActionResult Edit(int id)
      {
        Blog foundBlog = Blog.FindById(id);
        return View(foundBlog);
      }

      [HttpPost("/blogs/{id}/update")]
      public ActionResult Update(int id, string title, string about)
      {
        Blog editBlog = Blog.FindById(id);
        editBlog.Edit(editBlog.GetUsername(), editBlog.GetPassword(), title, about);
        return RedirectToAction("Show", editBlog);
      }
  }
}