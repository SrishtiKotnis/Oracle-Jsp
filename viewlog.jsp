<!DOCTYPE HTML>
<html>
    <head>
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LOGSHEET</title>
      <style>
           .back{
                width: 100%;
                height: 100%;
             background-color: bisque;
            
            
            }
          
            
             
            h1{
                color: white;
                font-style: bold;
                font-size:30px;
                background-color: brown;
            }
            
            
        </style>
        
         <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <link rel="stylesheet" href="/resources/demos/style.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <script>

  $( function() {

    $("#datepicker").datepicker();

  } );

  </script>

    </head>
    
    <%@ page import= "java.sql.*,java.util.*"%>
    <body>
        <div class="back">
        <h1>LOGSHEET</h1>
            
    
            <form action="viewlog.jsp" method="post">
           
                <table border="5px" class="choose">
                
                 <tr>
                 <td>DATE:</td><td><input type="text" id="datepicker" name="date1"></td>
                    </tr>
                </table>
                    </form>
                    
    
            
        <table border='5px'>
            
            
        <%  
           
           
           DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st=conn.createStatement();
        ResultSet rs =st.executeQuery("SELECT m.group1,m.desc1 AS OPERATIONS,m.group2,m.desc2,m.param_code,m.param_desc,t.param_value,t.t_date,t.section,t.section_inc FROM transactions t,masters m where t.group1=m.group1 order by m.group1,m.group2,m.param_code ");
           m nResultSetMetaData rsm=rs.getMetaData(); 
           
           %>
<%
            
            for (int i=1;i<=rsm.getColumnCount();i++)
                {
                %>
            
           <th><%=rsm.getColumnName(i)%></th>

    <%  } %>
        
            
             <% while (rs.next())
                    {%> 
                 <tr>
                    <% for(int i=1;i<=rsm.getColumnCount();i++){%>
                 
                 <td> <%=rs.getString(i)%> </td>
                       
              <%  } 
                 %>
                 </tr> 
                     
                     <% }
                         %>
                            
                         
                         
                         
                         <%
                            String date=request.getParameter("date1");
                             Connection conn1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st1=conn1.createStatement();
        ResultSet rs1 =st1.executeQuery("SELECT m.group1,m.desc1 AS OPERATIONS,m.group2,m.desc2,m.param_code,m.param_desc,t.param_value,t.t_date,t.section,t.section_inc FROM transactions t,masters m where t.group1=m.group1 order by m.group1,m.group2,m.param_code where t.t_date='"+date+"' ");
       ResultSetMetaData rsm1=rs1.getMetaData(); 
           
                            
                            
                            %>
                  </div>        
        </body>
        
        
</html>