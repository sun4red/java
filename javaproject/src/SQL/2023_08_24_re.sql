--2023-08-24 °úÁ¦


select ename, sal from  (

                    select rownum, ename, sal from  (
        
                                        select ename, sal from emp
                                        order by sal desc
                                                                 )
                    where rownum <=5 order by sal asc

)where rownum <=3 order by sal desc;