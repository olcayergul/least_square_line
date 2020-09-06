import java.util.Arrays;
import java.util.Scanner;

public class lsl {
    public static void main(String[] args) {
        final int row = 2;
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter number of points");
        int N = sc.nextInt();
        double[][] x_y = new double[row][N];
        double[] fx = new double[N];

        double sum_x = 0.0, sum_y = 0.0, sum_sqr_x = 0.0, sum_xy = 0.0, error = 0.0, sqr_error= 0.0, rms=0.0;

        for (int i = 0; i < x_y.length; i++) {    // ->>> x_y.length is row number
            for (int j = 0; j < x_y[i].length; j++) { // ->>> x_y.length[i] is row length
                x_y[i][j] = sc.nextDouble();
                System.out.println(Arrays.deepToString(x_y));
            }
        }
        System.out.println("Enter the f(xk) values");
        for (int i = 0; i < fx.length; i++) {
                fx[i] = sc.nextDouble();
        }

        for (int k = 0; k < N; k++) {
            sum_x += x_y[0][k];
            sum_sqr_x += Math.pow(x_y[0][k],2);
        }

        for (int k = 0; k < N; k++) {
            sum_y += x_y[1][k];
        }

        for (int k = 0; k < N; k++) {
            sum_xy += (x_y[0][k]) * (x_y[1][k]);
        }

        for (int k = 0; k < N; k++) {
            error += Math.abs((fx[k]) - (x_y[1][k]));
            sqr_error += Math.pow(Math.abs((fx[k]) - (x_y[1][k])),2);
        }

        rms = Math.pow(1.0 / (double) N * Math.abs(sqr_error),1.0 / 2.0);

        System.out.println("The sum of xk points " + sum_x);
        System.out.println("The sum of x^2  " + sum_sqr_x);
        System.out.println("The sum of yk points " + sum_y);
        System.out.println("xk * yk " + sum_xy);
        System.out.print("f(xk) values: ");
        for (double v : fx) {
            System.out.print(v + " ");
        }
        System.out.printf("\n ek: %.2f", error);
        System.out.printf("\n |e|^2: %.2f", sqr_error);
        System.out.printf("\n RMS: %.2f", rms);
    }
}

