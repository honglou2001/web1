package action;

import java.io.*;
import java.util.*;
public class Qsort{
	
	public static int partition(int a[],int p,int r){
		int i = p-1;
		int x = a[r];
		int tmp;
		for(int j=p; j<r; j++)
			if( a[j] <= x )
			{
				i++;
				tmp = a[i];
				a[i] = a[j];
				a[j] = tmp;
			}
		tmp = a[i+1];
		a[i+1] = a[r];
		a[r] = tmp;
		return i+1;
	}
	
	public static void qsort(int a[],int p,int r){
		if( p < r )
		{
			int q = partition(a,p,r);
			qsort(a,p,q-1);
			qsort(a,q+1,r);
		}
	}
	
	public static void main(String args[]){
		int a[] = new int[50];
		int n;
		Scanner cin = new Scanner(System.in);
		n = cin.nextInt();
		int i; 
		for(i=1; i<=n; i++)
			a[i] = cin.nextInt();
		qsort(a,1,n);
		for(i=1; i<=n; i++)
			System.out.print( "" + ' ' + a[i] );
	}
}