#include <iostream>
#include "sqlite3.h"

#define _DEBUG_ 1

using namespace std;

int main(int argc, char* argv[])
{
	
	sqlite3 *db = NULL;
	char *zErrMsg = 0;

	int rc;
	rc = sqlite3_open("mydemo.db", &db); //打开指定的数据库文件,如果不存在将创建一个同名的数据库文件
	if (rc)
	{
		
		cout << stderr << "Can't open database: " << sqlite3_errmsg(db) << endl;
		sqlite3_close(db);
		return (1);
	}
	else 
		cout<<"create or open Sqlite3 sucess" <<endl;
	
	//创建表  TABLE ，字段有:ID,SensorID ,SiteNum ,Time, SensorParameter
	char *sql = " CREATE TABLE SensorData(ID INTEGER PRIMARY KEY,SensorID INTEGER,SiteNum INTEGER,Time VARCHAR(12),SensorParameter REAL);";
	sqlite3_exec(db, sql, 0, 0, &zErrMsg);


	//插入数据 
	sql = "INSERT INTO SensorData VALUES(NULL , 4 , 1 , '201602011203', 18.9 );";
	sqlite3_exec(db, sql, 0, 0, &zErrMsg);

	sql = "INSERT INTO SensorData VALUES(NULL , 24 , 40 , '201602011303', 16.4 );";
	sqlite3_exec(db, sql, 0, 0, &zErrMsg);

	sql = "INSERT INTO SensorData VALUES(NULL , 34 , 15 , '201602011308', 15.4 );";
	sqlite3_exec(db, sql, 0, 0, &zErrMsg);


	int nrow = 0, ncolumn = 0;
	char **azResult; //二维数组存放结果

	//查询数据
	sql = "SELECT * FROM SensorData ";
	sqlite3_get_table(db, sql, &azResult, &nrow, &ncolumn, &zErrMsg);
	int i = 0;
	printf("row:%d column=%d  ", nrow, ncolumn);
	printf(" The result of querying is :  \r\n");
	for (i = 0; i < (nrow + 1) * ncolumn; i++)
		printf("azResult[%d] = %s  \r\n", i, azResult[i]);

	//删除数据
	sql = "DELETE FROM SensorData WHERE SensorID =0 ;";
	sqlite3_exec(db, sql, 0, 0, &zErrMsg);


#ifdef _DEBUG_
	printf("zErrMsg = %s  ", zErrMsg);
#endif
	sql = "SELECT * FROM SensorData ";
	sqlite3_get_table(db, sql, &azResult, &nrow, &ncolumn, &zErrMsg);
	printf(" row:%d column=%d ", nrow, ncolumn);
	printf(" After deleting , the result of querying is :  ");
	for (i = 0; i < (nrow + 1) * ncolumn; i++)
		printf("azResult[%d] = %s \r\n", i, azResult[i]);


	//释放掉 azResult 的内存空间
	sqlite3_free_table(azResult);

#ifdef _DEBUG_
	printf("zErrMsg = %s  ", zErrMsg);
#endif

	sqlite3_close(db); //关闭数据库



	system("pause");
	return 0;
}