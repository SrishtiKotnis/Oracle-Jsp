<!DOCTYPE HTML>
<html>
    <head>
        <title>roll-changing</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta charset="UTF-8">
        <style>
            body,html
            {
                height: 100%;
            }
            .back{
                width: 100%;
                height: 100%;
             background-image: url("SAIL.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                
            
            }
             
             
            h1{
                color: white;
                font-style: bold;
                font-size:30px;
                background-color: brown;
            }
            
            button{
                color:white;
                border:none;
                font-size:16px;
                 display: inline-block;
                text-align: center;
                background-color: brown;
            }
            
        
        </style>

    </head>
        <body>
            
            <div class="back">
                <h1>ROLL CHANGING</h1>
                <%@ page import="java.sql.*,java.util.*"%>
                    
               
 <%     
         DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st=conn.createStatement();
        ResultSet rs =st.executeQuery("SELECT unique desc2 FROM MASTERS WHERE GROUP1='02'");
       ResultSetMetaData rsm=rs.getMetaData();
    
  
    %>
     
          
                <center>
     <form action ="roll_change2.jsp" method="post">
         
         <table border="5px">
             <tr>
                 <td>ROLL TYPE</td>
                 <td><select name="roll-type" required>
                 <% while (rs.next())
                    {
                    for(int i=1;i<=rsm.getColumnCount();i++){%>
                 
                      
                       <option value="<%=rs.getString(i)%>">
                     <%=rs.getString(i)%>
                       
                     </option>
                 <%
                 }
                    }
                         %>
                     </select>
                         
                     </td>
                     
                 </tr>


             
         </table>
    
     
    
         <button type="submit" name="SUBMIT" onclick="document.getElementById('form2').style.display= 'block' ; return false; ">SHOW</button>
         </form>
                </center>
        
        <form action="main-menu.jsp" method="post">
        
            <button type="submit">BACK</button>
        </form>
                
     <%
         String rolltype=request.getParameter("roll-type");
        out.println(rolltype);
        String set=request.getParameter("setno");
        %>
     <div id="form2" style="display:none">
     
     <%
        Statement st1=conn.createStatement();
        ResultSet rs1=st1.executeQuery("SELECT distinct PARAM_CODE,PARAM_DESC FROM MASTERS WHERE GROUP1='02' ORDER BY PARAM_CODE");
        ResultSetMetaData rsm1=rs1.getMetaData();
        %>
         
         
          <div class="bd1">
             <form action="roll_change2.jsp>" method="post">
             <table border="5px">
                 
                 
         <%
            if(rs1!=null)
            {
            while(rs1.next())
            {
             %><tr>
               <% for(int j=1;j<=rsm1.getColumnCount();j++){%>
                  
                     <td><%=rs1.getString(j)%></td>
                     
                
             
            <% }
             %><td><input type="text"></td>
              </tr>
           <% } 
                
            }
              %>
        
                
             </table>
                 <button type="submit">SAVE</button>
                 </form>
             
             
            
              </div>
       
                 </div>
           
            </div>
         
        </body>
     
</html>