package net.skhu.mentoring.model;
import lombok.Data;
@Data
public class RadioOption {
	String value;
	String label;
	public RadioOption(String value, String label) {
		this.value=value;
		this.label=label;
	}
}
