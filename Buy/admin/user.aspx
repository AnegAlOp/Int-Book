﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="admin_user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table align="center" width="1000" border="1">
    <tr align="center"><td class="style1">编号</td><td class="style1">用户</td><td class="style1">密码</td><td class="style1">姓名</td><td class="style1">地址</td><td class="style1">性别</td><td class="style1">手机</td><td class="style1">邮箱</td><td class="style1">QQ</td><td class="style1">状态</td><td class="style1">时间</td><td class="style1">操作</td></tr>
    <%
        
        
        string id =Request.QueryString["id"];
        if (id != null)
        {
            YF.BLL.User.del(int.Parse(id));
            YF.JsHelper.AlertAndRedirect("删除成功！","user.aspx");

        }
        List<YF.Model.User> list = YF.BLL.User.list();
         %>
    <% for (int i = 0; i < list.Count; i++)
       {
           string sex = "";
           string state = "";
           
           if (list[i].Sex == 1)
           {
               sex = "男";
           }
           else {
               sex = "女";
           }

           if (list[i].State == 1)
           {
               state = "正常";
           }
           else
           {
              state = "关闭";
           }
           
           %>
    <tr align="center"><td><% =list[i].Id %></td><td><%=list[i].Username %></td><td><%=list[i].Password %></td><td><%=list[i].Name %></td><td><%=list[i].Address %></td><td><%=sex %></td><td><%=list[i].Mobile %></td><td><%=list[i].Email %></td><td><%=list[i].Qq %>
    </td><td><%=state%></td><td><%=list[i].Adddate%></td><td><a href="user.aspx?id=<%=list[i].Id %>">删除</a>|<a href="../user_edit.aspx?id=<%=list[i].Id %>">编辑</a></td></tr>
    <%} %>
    </table>
    </div>
    </form>
</body>
</html>
