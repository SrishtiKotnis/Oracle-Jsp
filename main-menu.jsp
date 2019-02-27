<!DOCTYPE>
<html>
    <head>
        <title>main-menu</title>
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
            
            .vertical-menu {
        
                column-gap: 50px;
                width: 450px;
                
                

}

.vertical-menu a {
    background-color: brown;
    color: white;
    display: block;
    padding: 12px;
    line-height: inherit;
    text-decoration: none;
}

.vertical-menu a:hover {
    background-color: darkred;
}

.vertical-menu a.active {
    background-color: darkblue;
    color: white;
            }
            
            h1{
                color: white;
                font-style: bold;
                font-size:30px;
                background-color: brown;
            }
            
            .logout{
                align-content: flex-end;
                margin: 10px;
                padding: 2px;
                
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
            <%@ pageimport="java.sql.*,java.util.*"%>
           
                
            <div class="back">
                        <center><h1>MENU</h1>
                            <br>
        
                <%
               String date=request.getParameter("date1");
               String shift=request.getParameter("shift");
               String section=request.getParameter("section");
               String incharge=request.getParameter("sec_inc");
               out.println(date);
                    out.println(shift);
                    out.println(section);
                    out.println(incharge);
                   
    
                session.setAttribute("thedate",date);
            
                session.setAttribute("theshift",shift);
                session.setAttribute("thesection",section);
                   session.setAttribute("theincharge",incharge);
               
               %>
                
            <br>
                <br>
            <div class="vertical-menu">
                 <a href="mill-check.jsp">MILL CHECKUP</a>
                 <a href="roll_change2.jsp">ROLL CHANGING</a>
                 <a href="hot-saw.jsp">HOT SAW</a>
                 <a href="delays.jsp">DELAYS/COBBLES</a>
                 <a href="crane-status.jsp">CRANE STATUS</a>
                 <a href="roll_assembly2.jsp" >ROLL ASSEMBLY</a>
                 <a href="#">ROLL DISMENTALING</a>
                 <a href="#">VERTICAL ROLL ASSEMBLY</a>
                 <a href="#">VERTICAL ROLL DISMENTAING</a>
                <a href="masters.jsp">MASTERS</a>
                <a href="viewlog.jsp">VIEW LOGSHEET</a>
                    </div>
               <br>
                    <br>
                    <center>
                     <form action="sheet_menu.jsp">
                 <button type="submit" name="submit" >BACK</button> 
           </form>
                    
                    </center>
                <div class="logout">
                    <form action="log-out.jsp" method="post">
                        <button type="submit">LOG OUT</button>
                    </form>
                
            
                
                </div>
                
            </div>
        </body>
    
    
</html>