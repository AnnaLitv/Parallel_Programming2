----------------------------------
--Lab1_Ada
--Anna Lytvynenko
--IP53
--5311
--a=MIN(a*B+C*(MO*MK))
----------------------------------
with Ada.Text_IO; 
use Ada.Text_IO;
with Data;
with Ada.Integer_Text_IO; 
use Ada.Integer_Text_IO;
with Ada.Synchronous_Task_Control;
use Ada.Synchronous_Task_Control;

type Vector is array(1..N) of Integer;
type Matrix is array(1..N, 1..N) of Integer;
----------------------------------------------------------------------------------
procedure Input_Vector(V: out Vector; N: Integer) is


begin
for  ind in 1..N loop
				V(ind):=1;
			end loop;
end Input_Vector;
-----------------------------------------------------------------------------------
procedure Input_Matrix(M: out Matrix; N: Integer) is
begin
for  ind in 1..N loop
			for  indx in 1..N loop
				M(ind,indx):=1;
			end loop;
			end loop;
end Input_Matrix;
-----------------------------------------------------------------------------------
function Mult_Matrixes(MA, MB: in Matrix; N: Integer) return Matrix is

		result: Matrix;

	begin
		for i in 1..N loop
			for j in 1..N loop
				result(i, j) := 0;
				for k in 1..N loop
					result(i, j) := result(i, j) + MA(i, k) * MB(k, j);
				end loop;
			end loop;
		end loop;

		return result;
	end Mult_Matrixes;
------------------------------------------------------------------------------------
function Mult_Vector_Matrix(A: in Vector; MB: in Matrix; N: Integer) return Vector is

		res: Vector;

	begin
		for i in 1..N loop
			res(i) := 0;
			for j in 1..N loop
				res(i) := res(i) + MB(j, i) * A(j);
			end loop;
		end loop;

		return res;
	end Mult_Vector_Matrix;
------------------------------------------------------------------------------------
function Sum_Vectors(A, B: in Vector; N:Integer) return Vector is

		res: Vector;

	begin
		for i in 1..N loop
			res(i) := A(i) + B(i);
		end loop;

		return res;
	end Sum_Vectors;
------------------------------------------------------------------------------------
function Min_Vector(A: in Vector; N: Integer) return Integer is

	res: Integer;

	begin
		res := A(1);
		for i in 2..N loop
			if res > A(i) then
				res := A(i);
			end if;
		end loop;

		return res;
	end Min_Vector;
------------------------------------------------------------------------------------
function Mult_Scalar_Vector(a: in Integer; B: in Vector; N: Integer) return Vector is

		res: Vector;

	begin
		for i in 1..N loop
			res(i) := a * B(i);
		end loop;

		return res;
	end Mult_Scalar_Vector;
------------------------------------------------------------------------------------
procedure Lab1_2 is
S1, S2:Suspension_Object;
a, j:Integer;
B, C	  : Vector := ( others => 0 );
MO, MK		  : Matrix:= ( others => (others => 0) );
-----------------------------------------
	task Fun1 with CPU=>0 is
		pragma Priority(1);
		pragma Storage_Size(900_000_000);
	end Fun1;
	
	task Fun2 with CPU=>1 is
		pragma Priority(1);
		pragma Storage_Size(900_000_000);
	end Fun2;
-----------------------------------------

task Fun1 body is
begin
Put_Line("task 1 started!");

Put_Line("task 1 finished!");
end Fun1;

task Fun2 body is
begin
Put_Line("task 2 started!");
Put_Line("task 2 finished!");
end Fun2;		

end Lab1_2;