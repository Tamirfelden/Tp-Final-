using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using TPFinal.Models;

namespace TPFinal.Models
{
    public static class BD
    {
        private static SqlConnection Conectar()
        {
            string SC = "Server =.; Database = Am Israel Defense Web; user id = alumno; password = alumno1;";
            SqlConnection Conex = new SqlConnection(SC);
            Conex.Open();
            return Conex;
        }

        private static void Desconectar(SqlConnection Conex)
        {
            Conex.Close();
        }

        public static List<TipoNoticias> TraerCategoria()
        {
            List<TipoNoticias> ListCategoria = new List<TipoNoticias>();
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            Consulta.CommandText = "sp_TraerCategoria";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
                int IdCategoria = Convert.ToInt32(dataReader["IdCategoria"]);
                string Nombre = Convert.ToString(dataReader["Nombre"]);
            }

            Conexion.Close();
            return ListCategoria;
        }


        public static List<Noticias> TraerNoticias()
        {

            List<Noticias> ListNoticias = new List<Noticias>();


            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.Text;
            Consulta.CommandText = "select IdNoticia, Titulo, Descripcion,Multimedia, fkCategoria from Noticias";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
                Noticias obj = new Noticias();
                obj.IdNoticia = Convert.ToInt32(dataReader["IdNoticia"]);
                obj.Titulo = Convert.ToString(dataReader["Titulo"]);
                obj.Descripcion = Convert.ToString(dataReader["Descripcion"]);
                obj.Multimedia = Convert.ToString(dataReader["Multimedia"]);
                obj.fkCategoria = Convert.ToString(dataReader["fkCategoria"]);


                ListNoticias.Add(obj);
            }

            Conexion.Close();
            return ListNoticias;
        }
        public static void CrearUsuarios(Usuarios user)
        {

            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            Consulta.CommandText = "sp_CrearUsuarios";
            Consulta.Parameters.AddWithValue("Nombre", user.Nombre);
            Consulta.Parameters.AddWithValue("Apellido", user.Apellido);
            Consulta.Parameters.AddWithValue("Email", user.Mail);
            Consulta.Parameters.AddWithValue("Clave", user.Clave);

            Consulta.ExecuteNonQuery();

            Conexion.Close();
        }

        public static bool ValidarUsuarios(Usuarios user)
        {
            bool Existe;
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            SqlCommand cmd = new SqlCommand("sp_VerificarUsuario", Conexion);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", user.Nombre);
            cmd.Parameters.AddWithValue("@Clave", user.Clave);

            SqlDataReader Lector = cmd.ExecuteReader();
            if (Lector.Read())
            {
                Existe = true;
            }
            else
            {
                Existe = false;
            }
            Desconectar(Conexion);
            return Existe;
        }


        public static Noticias  TraerUnaNoticia(int id)
        {
            Noticias obj = new Noticias();
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.Text;
            Consulta.CommandText = "select Titulo, Descripcion, Multimedia, fkCategoria from Noticias where IdNoticia =" + id + " ";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
 
                
                obj.Titulo = Convert.ToString(dataReader["Titulo"]);
                obj.Descripcion = Convert.ToString(dataReader["Descripcion"]);
                obj.Multimedia = Convert.ToString(dataReader["Multimedia"]);
                obj.fkCategoria = Convert.ToString(dataReader["fkCategoria"]);

            }

            Conexion.Close();
            return obj;
        }
        public static Noticias SubirNoticia(string Titulo, string Descripcion, string Multimedia, string fkCategoria )
        {
            Noticias obj = new Noticias();
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.Text;
            Consulta.CommandText = "insert into noticias " + Titulo + Descripcion + Multimedia + fkCategoria + " ";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {


                obj.Titulo = Convert.ToString(dataReader["Titulo"]);
                obj.Descripcion = Convert.ToString(dataReader["Descripcion"]);
                obj.Multimedia = Convert.ToString(dataReader["Multimedia"]);
                obj.fkCategoria = Convert.ToString(dataReader["fkCategoria"]);

            }

            Conexion.Close();
            return obj;
        }
    }
}



