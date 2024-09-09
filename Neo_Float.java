import java.util.Random;

public class Neo_Float {
    public static double[][] createMatrix1() {
        Random random = new Random();
        int matrix1row = random.nextInt(6000)+1; //matrix 1 row
        int matrix1col = random.nextInt(6000)+1; //matrix 1 col
        
        while (matrix1row == matrix1col) { //Make sure matrix 1 isn't square
        	matrix1col = random.nextInt(6000);
        }
        
        double[][] matrix1 = new double[matrix1row][matrix1col];
        for (int a = 0; a < matrix1row; a++) {
            for (int b = 0; b < matrix1col; b++) {
                matrix1[a][b] = random.nextDouble();
            }
        }
        return matrix1;
    }
    
    public static double[][] createMatrix2(int matrix1col) {
    	Random random = new Random();
        int matrix2row = matrix1col; // matrix 2 row equals matrix 1 col
        int matrix2col = random.nextInt(6000)+1; //matrix 2 col
    	
        while (matrix2row == matrix2col) { //Make sure matrix 2 isn't square
        	matrix1col = random.nextInt(6000);
        }
        	
        double[][] matrix2 = new double[matrix2row][matrix2col];
        for (int a = 0; a < matrix2row; a++) {
        	for (int b = 0; b < matrix2col; b++) {
        		matrix2[a][b] = random.nextDouble();
                 }
        	}
        return matrix2;
    }
    
    public static double[][] multiplyMatrices(double[][] matrix1, double[][] matrix2) {
        int matrix1row = matrix1.length;
        int matrix1col = matrix1[0].length;
        int matrix2row = matrix2.length;
        int matrix2col = matrix2[0].length;
        
        double[][] matrix3 = new double[matrix1row][matrix2col];
        int a, b, c;
        for (a = 0; a < matrix1row; a++) {
            for ( b = 0; b < matrix2col; b++) {
            	matrix3[a][b]=0;
                for (c = 0; c < matrix1col; c++) {
                    matrix3[a][b] += matrix1[a][c] * matrix2[c][b];
                }
            }
        }
        return matrix3;
    }

    public static void main(String[] args) {
    	long startTime = System.nanoTime();
    	double[][] matrix1 = createMatrix1();
    	int matrix1col = matrix1[0].length;
        double[][] matrix2 = createMatrix2(matrix1col); //Make sure matrix 1 & 2 are same length
        
        System.out.println("Matrix 1:"); //Print matrix 1
        for (double[] row : matrix1) {
            for (double value : row) {
                System.out.print(value + " ");
            }
            System.out.println();
        }

        System.out.println("Matrix 2:"); //Print matrix 2
        for (double[] row : matrix2) {
            for (double value : row) {
                System.out.print(value + " ");
            }
            System.out.println();
        }
        double[][] matrix3 = multiplyMatrices(matrix1, matrix2);
        
        System.out.println("Matrix 3:"); //Print matrix 3
        for (double[] row : matrix3) {
            for (double value : row) {
                System.out.print(value + " ");
            }
            System.out.println();
        }
        long endTime = System.nanoTime();
        long runTime = endTime - startTime;
        System.out.println("Runtime: " + (runTime / 1_000_000_000) + " seconds");
    }
}