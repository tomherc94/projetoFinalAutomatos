package gui;

import java.io.IOException;
import java.io.StringReader;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import model.services.LexicalAnalyzer;

public class MainViewController {

	@FXML
	private TextArea txtAreaPseudo;

	@FXML
	private TextArea txtAreaC;

	@FXML
	private Button btConverter;

	@FXML
	public void btConverterAction() {
		try {
			StringBuilder sb = new StringBuilder();
			sb.append(txtAreaPseudo.getText());
			convert(sb);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

	}

	public void convert(StringBuilder sb) throws IOException {
		LexicalAnalyzer lexical = new LexicalAnalyzer(new StringReader(sb.toString()));
		StringBuilder result = new StringBuilder();
		result.append(lexical.yylex());
		//txtAreaC.setText(lexical.yylex().toString());
		System.out.println(result.toString());
	}
}
