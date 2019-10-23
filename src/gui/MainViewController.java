package gui;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;

public class MainViewController {

	@FXML
	private TextArea txtAreaPseudo;
	
	@FXML
	private TextArea txtAreaC;
	
	@FXML
	private Button btConverter;
	
	@FXML
	public void btConverterAction() {
		System.out.println("btConverterAction");
	}
}
