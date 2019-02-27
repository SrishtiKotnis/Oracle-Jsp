<!DOCTYPE HTML>
<html>
    <head>
    <title>mill-checkup</title>
        <meta name="viewport" content="width=devie-width initail-scale=1.0">
            
        
        <style>
            
            .back{
                width: 100%;
                height: 100%;
             background-color: bisque;
            
            
            }
            
            .tb1{
                align-content: center;
                margin: 30px;
                
            }
            
            button{
                color:white;
                border:none;
                font-size:16px;
                 display: inline-block;
                text-align: center;
                background-color: brown;
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
        
            <h1> MILL CHECK</h1>
      <%@ pageimport="java.sql.*,java.util.*,oracle.jdbc.driver.*"  %>
            
 <%@ page language="java"%>          
           
                 <%
               
                
                %>
        
         
          
            
                      <% String date2=(String)session.getAttribute("thedate");
                          String shift=(String)session.getAttribute("theshift");
                          String section=(String)session.getAttribute("thesection");
                          String incharge=(String)session.getAttribute("theincharge");
                         %>
                         
                   Date:  <% out.println(date2);%>
                   Shift: <% out.println(shift); %>
                   Section: <% out.println(section); %>
                   Section Incharge: <% out.println(incharge); %>          
                <center>
                    <form action="mill-check.jsp" method="post">
                  <table border="5px" class="tb1">
 <% 
            
    
        
    
         DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st=conn.createStatement();
        ResultSet rs =st.executeQuery("SELECT PARAM_CODE,PARAM_DESC FROM MASTERS where GROUP1='01' ORDER BY PARAM_CODE");
         ResultSetMetaData rsm=rs.getMetaData(); %>
             
<%
   
if(rs!= null)
   {
     while(rs.next())
  { 
   String  pcode=rs.getString("param_code");								 
  String pdesc=rs.getString("param_desc");	
   %> 
    
    <tr> 
        
        <%
 for(int i=1;i<=rsm.getColumnCount();i++){%>
    <td><%=rs.getString(i)%></td>
   
  <%
    } 
     %>
      <td><input type="hidden" name="param_code" value="<%=pcode%>"></td>
     <td><input type="text" name="param_value" required></td>
      </tr>
             
        
        
       <%
          }
     
    }
        %>
 <button type="submit">SUBMIT</button>
         </form>
    
               </table>
             
                
   
                  <%  int i;
                     DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
                     Connection conn1= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
                      Statement st1=conn1.createStatement();
                     
                     String[] s1=new String[0];
                     String[] s2=new String[0];
                     
                      String pname=null;		  		  
				     Enumeration g=request.getParameterNames();
                     while(g.hasMoreElements()){
                       pname=(String)g.nextElement();
                     if (pname.equals("param_code"))
                     {
                       s1=request.getParameterValues(pname);
                     }
                     if(pname.equals("param_value"))
                     {
                      s2=request.getParameterValues(pname);
                     }
         
                       }//while g 
                     
                    int n=s1.length;
                      out.println(n);
                     
                       for(i=0;i<s1.length;i++){ %>
        
        <%
           
                        
            String qry="insert into transactions(group1,param_code,param_value,t_date,shift,section,section_inc)values('01',?,?,'"+date2+"','"+shift+"','"+section+"','"+incharge+"')";
            PreparedStatement ps= conn1.prepareStatement(qry);
        
            ps.setString(1, s1[i]);
            ps.setString(2, s2[i]);
            ps.executeUpdate();
    
          ps.close(); 
    }
                    
                        
            
  
    
    %>
        
        <%  out.println("Data Entered");%>
        

     
         
          
                </center>       
                      
                      
                      
                      
                      
                      
                <br>
                      <br>
                <form action="main-menu.jsp" method="post">
                    <button type="submit"> BACK </button>
                      </form>
               
  <table border='5px'>  
    <%     
            
                     Connection conn2= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
             PreparedStatement ps2 = conn2.prepareStatement( "SELECT t.param_code,m.param_desc,t.param_value,t.t_date,t.shift,t.section,t.section_inc FROM MASTERS m,TRANSACTIONS t where m.GROUP1='01' and t.param_code=m.param_code"); 
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
            
             </div>
    
    </body>
    
</html>