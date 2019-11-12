using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace TPFinal.Models
{
    public static class BD
    {
        private static SqlConnection Conectar()
        {
            string SC = "Server =.; Database = Am Israel Defense; Trusted_Connection = True;";
            SqlConnection Conex = new SqlConnection(SC);
            Conex.Open();
            return Conex;
        }
        private static void Desconectar(SqlConnection Conex)
        {
            Conex.Close();
        }
        public static List<CategoriaNoticia> TraerCategoria()
        {
            List<Categoria> ListCategoria = new List<Categoria>();
            SqlConnection Conexion = BD.Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandType = System.Data.CommandType.storedprocedures;
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
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            Consulta.CommandText = "sp_TraerNoticia";
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
                int IdNoticia = Convert.ToInt32(dataReader["IdNoticia"]);
                int fkCategoria = Convert.ToInt32(dataReader["fkCategoria"]);
                string Titulo = Convert.ToString(dataReader["Titulo"]);
                string Descripcion = Convert.ToString(dataReader["Descripcion"]);
                bool Destacado = Convert.ToBoolean(dataReader["Destacado"]);
                string Multimedia = Convert.ToString(dataReader["Multimedia"]);

            }

            Conexion.Close();
            return ListNoticias;
        }
       
        }
    }



