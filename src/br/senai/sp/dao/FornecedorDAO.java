package br.senai.sp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.senai.sp.banco.Conexao;
import br.senai.sp.model.AdicionarFornecedor;
import br.senai.sp.model.Fornecedor;

public class FornecedorDAO {
	private ArrayList<AdicionarFornecedor> lista = new ArrayList<>();

	public static FornecedorDAO instance;

	public void salvarFornecedor(AdicionarFornecedor fornecedor){
		String sql = "INSERT INTO fornecedor (nomeFornecedor , telefone, celular,email,cnpj) VALUES (?,?,?,?,?)";

		try{
			PreparedStatement stm = Conexao.getConexao().prepareStatement(sql);
			stm.setString(1, fornecedor.getFornecedor());
			stm.setString(2, fornecedor.getTelefone());
			stm.setString(3, fornecedor.getCelular());
			stm.setString(4, fornecedor.getEmail());
			stm.setString(5, fornecedor.getCnpj());
			stm.execute();

			Conexao.fecharConexao();

		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	public static FornecedorDAO getInstance(){
		if(instance == null)
			instance = new FornecedorDAO();

		return instance;
	}

	public ArrayList<Fornecedor> selectAll(){
		ArrayList fornecedores = new ArrayList<>();
		String sql = "SELECT * FROM fornecedor";
		PreparedStatement stm;
		try {
			stm = Conexao.getConexao().prepareStatement(sql);
			ResultSet rs = stm.executeQuery();

			while(rs.next()){
				Integer id = rs.getInt("idFornecedor");
				String nome = rs.getString("nomeFornecedor");
				String telefone = rs.getString("telefone");
				String celular = rs.getString("celular");
				String email = rs.getString("email");
				String cnpj = rs.getString("cnpj");

//System.out.println(id);

				Fornecedor fornecedor = new Fornecedor(id, nome, telefone, celular, email, cnpj);

				fornecedores.add(fornecedor);

			}
			Conexao.fecharConexao();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return fornecedores;
	}

	public boolean deletar(int id){
		String sql = "DELETE FROM fornecedor WHERE idFornecedor=?";

		try {
			PreparedStatement ps = Conexao.getConexao().prepareStatement(sql);
			ps.setInt(1, id);

			int rowsDeleted = ps.executeUpdate();
			if(rowsDeleted> 0){
				return true;

			}
			Conexao.fecharConexao();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;

	}

	public boolean atualizar (Fornecedor fornecedor){
		String sql = "UPDATE fornecedor SET nomeFornecedor=?, telefone=?, celular=?, email=?, cnpj=? WHERE idFornecedor=?";

		try {
			PreparedStatement ps = Conexao.getConexao().prepareStatement(sql);
			ps.setString(1, fornecedor.getNome());
			ps.setString(2, fornecedor.getTelefone());
			ps.setString(3, fornecedor.getCelular());
			ps.setString(4, fornecedor.getEmail());
			ps.setString(5, fornecedor.getCnpj());
			ps.setInt(6, fornecedor.getId());

			int rowUpdated = ps.executeUpdate();

			if(rowUpdated > 0){
				return true;

			}
			Conexao.fecharConexao();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
}
