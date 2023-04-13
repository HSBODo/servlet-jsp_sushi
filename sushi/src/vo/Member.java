package vo;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.Data;

@NoArgsConstructor
@AllArgsConstructor
@Data
@RequiredArgsConstructor
//@Getter
//@Setter
//@ToString

public class Member {
	
	private String id;
	@NonNull
	private String pwd;
	private String email;
	private String name;
	

}
