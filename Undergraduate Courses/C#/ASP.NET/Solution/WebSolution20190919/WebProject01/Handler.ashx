﻿<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
/*
        context.Response.ContentType = "text/html";
        context.Response.Write("Hello World");
*/
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connString)) { 
            using(SqlDataAdapter apter=new SqlDataAdapter("select * from UserInfo",conn)) { 
                DataTable da = new DataTable(); 
                apter.Fill(da); 
                StringBuilder sb = new StringBuilder(); 
                for (int i = 0; i < da.Rows.Count; i++) { 
                    sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td><a href='ShowDetail.ashx?id={5}'> 详 细 </a></td></tr>", 
                        da.Rows[i]["SN"], da.Rows[i]["UserName"], da.Rows[i]["UserPass"],Convert.ToDateTime(da.Rows[i]["RegTime"]).ToShortDateString(), da.Rows[i]["Email"],da.Rows[i]["ID"]); 
                } 
                string filePath = context.Request.MapPath("UserInfoList.html"); 
                string fileContent = File.ReadAllText(filePath); 
                fileContent= fileContent.Replace("$tbody",sb.ToString()); 
                context.Response.Write(fileContent); 
            } 
        }

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}