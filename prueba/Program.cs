using System;

namespace prueba
{
    class Program
    {
        static void Main(string[] arg)
        {
            inicio();
            Console.ReadKey();
        }

        static void inicio()
        {
            try
            {
                Console.Write("¿Qué parte de la prueba desea realizar?\n\n1. Número mayor a 5\n2. Calculadora\n3. Año bisiesto\n4. Salir\n");
                int parte = int.Parse(Console.ReadLine());

                Console.Clear();
                if (parte < 1 || parte > 4)
                {
                    Console.Write("Opción invalida.\n Intente nuevamente\n\n");
                    inicio();
                    return;
                }

                rutaMenu(parte);
            }
            catch (System.Exception)
            {
                Console.Clear();
                Console.WriteLine("ERROR!! - La entrada no es valida");
                inicio();
            }
        }

        static void rutaMenu(int parte)
        {
            switch (parte)
            {
                case 1:
                    parteuno();
                    break;
                case 2:
                    partedos();
                    break;
                case 3:
                    partetres();
                    break;
                case 4:
                    salir();
                    break;
            }
        }

        static void opcionSalir(int parte)
        {
            Console.WriteLine("\n\n1. Intentar de nuevo");
            Console.WriteLine("2. Salir");

            int opc = int.Parse(Console.ReadLine());

            if (opc != 1 && opc != 2)
            {
                Console.WriteLine("Opción invalida");
                opcionSalir(parte);
            }

            Console.Clear();
            if (opc == 1)
            {
                rutaMenu(parte);
            }
            else
            {
                inicio();
            }
        }

        static void parteuno()
        {
            try
            {
                Console.Write("Ingrese un número entre 1  y 5: ");

                int num = int.Parse(Console.ReadLine());

                if (num > 5)
                {
                    Console.WriteLine("Número Inválido\n");
                    Console.WriteLine("Intente nuevamete");
                    parteuno();
                }
                else
                {
                    for (int i = 1; i <= num; i++)
                    {
                        Console.WriteLine("     Número: " + i);
                    }
                    opcionSalir(1);
                }
            }
            catch (System.Exception)
            {
                Console.Clear();
                Console.WriteLine("ERROR!! - La entrada no es valida");
                parteuno();
            }
        }

        static void partedos()
        {
            try
            {
                Console.WriteLine("A continuación digite dos número para realizar una operación\n\n");
                Console.Write("Primer número: ");
                int numero1 = int.Parse(Console.ReadLine());

                Console.Write("Segundo número: ");
                int numero2 = int.Parse(Console.ReadLine());

                Console.WriteLine("¿Qué operación desea realizar?");
                Console.Write("\n1. Suma\n2. Resta\n3. Multiplicaión\n4. División\n\n");
                int operacion = int.Parse(Console.ReadLine());

                if (operacion < 1 || operacion > 4)
                {
                    Console.Write("\nOpción invalida");
                    partedos();
                }

                int resultado = 0;
                string ope = "";

                switch (operacion)
                {
                    case 1:
                        ope = "Suma";
                        resultado = numero1 + numero2;
                        break;
                    case 2:
                        ope = "Resta";
                        resultado = numero1 - numero2;
                        break;
                    case 3:
                        ope = "Multiplicaión";
                        resultado = numero1 * numero2;
                        break;
                    case 4:
                        ope = "División";
                        resultado = numero1 / numero2;
                        break;
                }

                Console.WriteLine("El resultado de la " + ope + " es: " + resultado);

                opcionSalir(2);
            }
            catch (System.Exception)
            {
                Console.Clear();
                Console.WriteLine("ERROR!! - La entrada no es valida");
                partedos();
            }
        }

        static void partetres()
        {
            try
            {
                Console.WriteLine("Calcular años bisiestos\n\n");

                Console.Write("¿Qué año desea calcular?\n");
                int anio = int.Parse(Console.ReadLine());

                if (Convert.ToInt32(anio) % 4 == 0 && Convert.ToInt32(anio) % 100 != 0 || Convert.ToInt32(anio) % 400 == 0)
                {
                    Console.WriteLine("El año " + anio + " SI es bisiesto \n");
                }
                else
                {
                    Console.WriteLine("El año " + anio + " NO es bisiesto \n");
                }

                opcionSalir(3);
            }
            catch (System.Exception)
            {
                Console.Clear();
                Console.WriteLine("ERROR!! - La entrada no es valida");
                partetres();
            }
        }

        static void salir()
        {
            Console.WriteLine("Gracias. \nQue tenga buen día");
            return;
        }
    }
}

