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
            string SC = "Server =.; Database = AmIsraelDefenseWeb; user id = Tamir; password = Cissab4648;";
            SqlConnection Conex = new SqlConnection(SC);
            Conex.Open();
            return Conex;
        }

        private static void Desconectar(SqlConnection Conex)
        {
            Conex.Close();
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
                obj.fkCategoria = Convert.ToInt32(dataReader["fkCategoria"]);


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
                obj.fkCategoria = Convert.ToInt32(dataReader["fkCategoria"]);

            }

            Conexion.Close();
            return obj;
        }

        public static void SubirNoticia(Noticias user)
        {

           
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            Consulta.CommandText = "sp_CargarNoticias";
            Consulta.Parameters.AddWithValue("Titulo", user.Titulo);
            Consulta.Parameters.AddWithValue("Descripcion", user.Descripcion);
            Consulta.Parameters.AddWithValue("Multimedia", user.Multimedia);
            Consulta.Parameters.AddWithValue("fkCategoria", user.fkCategoria);

            Consulta.ExecuteNonQuery();            
            Conexion.Close();
           
        }

        public static List<Categorias> TraerCategoria()
        {
            List<Categorias> ListCategoria = new List<Categorias>();
           
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.Text;
            Consulta.CommandText = "select Nombre, idCategorias from Categorias";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
                Categorias Cat = new Categorias();
                Cat.idCategoria = Convert.ToInt32(dataReader["IdCategorias"]);
                Cat.Categoria= Convert.ToString(dataReader["Nombre"]);
                ListCategoria.Add(Cat);
            }
            
            return ListCategoria;
        }

        /*
        public static List<Noticias> NoticiasCategoria(int idCat)
        {
            List<Noticias> NoticiasXCategoria = new List<Noticias>();

            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.Text;
            Consulta.CommandText = "select * from Noticias where fkCategoria=" + idCat + " ";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
                Noticias not = new Noticias();
                not.IdNoticia = Convert.ToInt32(dataReader["IdNoticia"]);
                not.Titulo = Convert.ToString(dataReader["Titulo"]);
                not.Titulo = Convert.ToString(dataReader["Descripcion"]);
                not.Titulo = Convert.ToString(dataReader["Multimedia"]);
                NoticiasXCategoria.Add(not);
            }

            return NoticiasXCategoria;
        }
        */


        public static void BorrarNoticia(int idNoticia)
        {           
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.Text;
            Consulta.CommandText = "delete from Noticias where IdNoticia =" + idNoticia + " ";
            SqlDataReader dataReader = Consulta.ExecuteReader();
           

            Conexion.Close();           
        }

        public static List<Noticias> UpdateNoticias(int id)
        {
            List<Noticias> ListNoticias = new List<Noticias>();
            Noticias not = new Noticias();
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.Text;
            Consulta.CommandText = "update Noticias set Titulo =" + not.Titulo + " , Descripcion= " + not.Descripcion +", Multimedia=" + not.Multimedia + " , fkCategoria= " + not.fkCategoria + " where idNoticia ="+id+" ";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
                not.Titulo = Convert.ToString(dataReader["Titulo"]);
                not.Descripcion = Convert.ToString(dataReader["Descripcion"]);
                not.Multimedia = Convert.ToString(dataReader["Multimedia"]);
                not.fkCategoria = Convert.ToInt32(dataReader["fkCategoria"]);
                not.IdNoticia = Convert.ToInt32(dataReader["idNoticia"]);
                ListNoticias.Add(not);
            }
            
            Conexion.Close();
            return ListNoticias;
        }
        public static void CargarNoticia(Noticias noti)
        {
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            Consulta.CommandText = "sp_CargarNoticias1";
            Consulta.Parameters.AddWithValue("IdNoticia", noti.IdNoticia);
            Consulta.Parameters.AddWithValue("Titulo", noti.Titulo);
            Consulta.Parameters.AddWithValue("Descripcion", noti.Descripcion);
            Consulta.Parameters.AddWithValue("Multimedia", noti.Multimedia);
            Consulta.Parameters.AddWithValue("fkCategoria", noti.fkCategoria);

            Consulta.ExecuteNonQuery();
            Conexion.Close();

        }
        public static Noticias UnaFoto(Noticias noti)
        {
           
            Noticias not = new Noticias();
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.Text;
            Consulta.CommandText = "select Multimedia From Noticias WHERE IdNoticia = "+  noti.IdNoticia+" ";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
                not.Multimedia = Convert.ToString(dataReader["Multimedia"]);                
            }
            Conexion.Close();
            return not;
        }

    }

}



