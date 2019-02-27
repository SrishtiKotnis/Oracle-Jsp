<!DOCTYPE>
<html>
    <head>
        <title>hot-saw</title>
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
             background-color:bisque;
                background-repeat: repeat;
                background-size: cover;
            }
            button{
                color:white;
                border:none;
                font-size:16px;
                 display: inline-block;
                text-align: center;
                background-color: brown;
            }
            button:hover{
                color: darkred;
            }
            
          
             h1{
                color: white;
                font-style: bold;
                font-size:30px;
                background-color: brown;
            }
            
        </style>
        
    </head>
    
    <body>
        <div class="back">
            
            
            <h1>HOT-SAW</h1>
                    
                <center>
                      
                      
                       <%@ pageimport="java.sql.*,java.util.*" %>
                           
                           
                      <% String date2=(String)session.getAttribute("thedate");
                          String shift=(String)session.getAttribute("theshift");
                          String section=(String)session.getAttribute("thesection");
                          String incharge=(String)session.getAttribute("theincharge");
                         %>
                 <tr>   
 <% 
     
         DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st=conn.createStatement();
        ResultSet rs =st.executeQuery("SELECT group2,desc2,param_code,PARAM_DESC FROM MASTERS WHERE group1='03' order by group2");
         ResultSetMetaData rsm = rs.getMetaData();
   
    
    %>
          <form action="hot-saw.jsp" method="post">

       <table border="5px">
    
                     
<%
   
if (rs != null)
 {
  while(rs.next())
  { 
   
   String gcode=rs.getString("group2");								 
  String gdesc=rs.getString("desc2");	
   
   String  pcode=rs.getString("param_code");								 
  String pdesc=rs.getString("param_desc");	
   %> 
    <tbody>
    <tr> <%
            int n=rsm.getColumnCount();
 for (int i=1;i<=rsm.getColumnCount();i++)
  {
  %>
    <td><%=rs.getString(i) %></td>
   
  <%
  } %>
        <td><input type="hidden" name="group2" value="<%=gcode%>"></td>
       <td><input type="hidden" name="param_code" value="<%=pcode%>"></td>
       <td><input type="text" name="param_value"></td>
      
  </tr>
        <tbody><%
  }
 }
          
 
 %>
          
          
</table>
     
    
       
     </center>
     <center>
        
           <button type="submit">SUBMIT</button>
         </form>
                </center>
     
               
    
    <%   
                     String[] s1=new String[0];
                     String[] s2=new String[0];
                     String[] s3=new String[0];
                     
                      String pname=null;		  		  
				     Enumeration g=request.getParameterNames();
                     while(g.hasMoreElements()){
                       pname=(String)g.nextElement();
                     if (pname.equals("group2"))
                     {
                       s1=request.getParameterValues(pname);
                     }
                     if(pname.equals("param_code"))
                     {
                      s2=request.getParameterValues(pname);
                     }
                     if(pname.equals("param_value"))
                     {
                      s3=request.getParameterValues(pname);
                     }
         
                       }//while g 
                
                     
                       for(int i=0;i<s1.length;i++){ %>
        
        <%
           
                        
            String qry="insert into transactions(group1,groupr2,param_code,param_value,t_date,shift,section,section_inc)values('03',?,?,?,'"+date2+"','"+shift+"','"+section+"','"+incharge+"')";
            PreparedStatement ps= conn.prepareStatement(qry);
        
            ps.setString(1, s1[i]);
            ps.setString(2, s2[i]);
            ps.setString(3, s3[i]);
            ps.executeUpdate();
    
          ps.close(); 
    }
                    
                         %>
            
            
            
              <table border='5px'>  
    <%     
            
                     Connection conn2= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
             PreparedStatement ps2 = conn2.prepareStatement( "SELECT t.groupr2,m.desc2,t.param_code,m.param_desc,t.param_value,t.t_date,t.shift,t.section,t.section_inc FROM masters m inner join TRANSACTIONS t on m.group1=t.group1 and m.group2=t.groupr2 and m.GROUP1='03' AND m.param_code=t.param_code and t.t_date IS NOT null order by t.groupr2,t.param_code,t_date"); 
             ResultSet rs2 = ps2.executeQuery(); %>
                 
    
        <%
              ResultSetMetaData rsm2 = rs2.getMetaData();
            for (int i2=1;i2<=rsm2.getColumnCount();i2++)
                {
                %>
            
           <th><%=rsm2.getColumnName(i2)%></th>

    <%  } %>
</tr>   
               
 <%
    if(rs2!=null)
    {
       while (rs2.next()) { %>
    <tr>
    <%
    for(int i1 = 1; i1 <= rsm2.getColumnCount(); i1++){ %>
        <td>
        <%=rs2.getString(i1)%>
        </td>
    <%
       }
    %>
    </tr>
<%
 }
   
  }
   

   rs2.close();
   conn2.close();
       
       %>
    </table>
                 
        <form action="main-menu.jsp" method="post">
        
            <button type="submit">BACK</button>
        </form>
                
        </div>
    
        </body>
</html>