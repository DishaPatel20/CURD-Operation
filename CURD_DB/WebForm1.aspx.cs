using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace CURD_DB
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        static string conString = @"Data Source=ADMIN-PC\DISHASQL;Initial Catalog=ASPNET;Integrated Security=True";
       SqlConnection con = new SqlConnection(conString);
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GridRefresh();
            }
        }

        void GridRefresh()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select * from CURD_DB", con);
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("insert into CURD_DB values(@id,@name,@gender,@age,@email)", con);
                con.Open();
                cmd.Parameters.AddWithValue("@id",txtId.Text);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@gender", rblGender.SelectedValue);
                cmd.Parameters.AddWithValue("@age", txtAge.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.ExecuteNonQuery();

                txtId.Text = null;
                txtName.Text = null;
                rblGender.SelectedValue = null;
                txtAge.Text = null;
                txtEmail.Text = null;

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
            GridRefresh();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select * from CURD_DB where ID =" + txtId.Text, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.Read())
                {
                    txtId.Text = dr["ID"].ToString();
                    txtName.Text = dr["NAME"].ToString();
                    rblGender.Text = dr["GENDER"].ToString();
                    txtAge.Text = dr["AGE"].ToString();
                    txtEmail.Text = dr["EMAIL"].ToString();

                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("update CURD_DB set ID=@id, NAME=@name,GENDER=@gender,AGE=@age,EMAIL=@email where ID = " + txtId.Text, con);
                con.Open();
                cmd.Parameters.AddWithValue("@id", txtId.Text);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@gender", rblGender.SelectedValue);
                cmd.Parameters.AddWithValue("@age", txtAge.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.ExecuteNonQuery();

                txtId.Text = null;
                txtName.Text = null;
                rblGender.SelectedValue = null;
                txtAge.Text = null;
                txtEmail.Text = null;
            }
            catch (Exception ex)
                {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
            GridRefresh();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("delete from CURD_DB  where ID = " + txtId.Text, con);
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
            GridRefresh();
        }

    }
}