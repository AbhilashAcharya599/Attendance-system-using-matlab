function result(a)
Recognized_index=a;
load('database.mat');
conn = database.ODBCConnection('facerecog','','');
sqlquery = 'select * from student';
curs = exec(conn,sqlquery);
curs = fetch(curs);
% curs.Data
colnames = {'StdName', 'Subject_ID','Semester','Date','Status'};
% switch(Recognized_index)
%     case Recognized_index
        if(Recognized_index<=30)
            exdata = {'Salman Yousaf',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
            display('Salman Yousaf is present')
            
            
        elseif(Recognized_index>30)&&(Recognized_index<=59)
             exdata = {'Noman Usmani',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
         display('Noman Usmani is present')
           
           
           elseif(Recognized_index>59)&&(Recognized_index<=71)
                exdata = {'Waqas Haider',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Waqas Haider is present')
           
           
            elseif(Recognized_index>71)&&(Recognized_index<=88)
                 exdata = {'Abdul Latif',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Abdul Latif is present')
           
           
            elseif(Recognized_index>88)&&(Recognized_index<=115)
                 exdata = {'Adnan Anwar',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Adnan Anwar is present')
           
           
           elseif(Recognized_index>115)&&(Recognized_index<=121)
                exdata = {'Faisal Khan',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Faisal Khan is present')
           
           
           elseif(Recognized_index>121)&&(Recognized_index<=159)
                exdata = {'Jamil Ur Rahman',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Jamil Ur Rahman is present')
           
           
           elseif(Recognized_index>159)&&(Recognized_index<=180)
                exdata = {'Noor Islam',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Noor Islam is present')
           
           
           elseif(Recognized_index>180)&&(Recognized_index<=191)
                exdata = {'Rizwan Muner',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Rizwan Muner is present')
           
           
           
           elseif(Recognized_index>191)&&(Recognized_index<=221)
                exdata = {'Salman Khan',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Salman Khan is present')
           
           
           elseif(Recognized_index>221)&&(Recognized_index<=224)
                exdata = {'Murad Haider',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Murad Haider is present')
           
           
           elseif(Recognized_index>224)&&(Recognized_index<=252)
                exdata = {'Zia Ur Rahman',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Zia Ur Rahman is present')
           
           
           elseif(Recognized_index>252)&&(Recognized_index<=225)
                exdata = {'Zia Ur Rahman',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Zia Ur Rahman is present')
           
           
           elseif(Recognized_index>225)&&(Recognized_index<=263)
                exdata = {'Shafi Ullah',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Shafi Ullah is present')
           
           
           elseif(Recognized_index>263)&&(Recognized_index<=276)
                exdata = {'Yar Muhammad',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Yar Muhammad is present')
           
           
           elseif(Recognized_index>276)&&(Recognized_index<=302)
                exdata = {'Waqar',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
           display('Waqar is present')
           
           
           elseif(Recognized_index>302)&&(Recognized_index<=314)
                exdata = {'Shafi Ullah',sub, sem, dates, 'Present'};
            insert(conn, 'student', colnames, exdata);
          display('Shafi Ullah  is present')
        end
end