package com.chainsys.chatspring.validate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.chainsys.chatspring.exceptions.InvalidInputException;
import com.chainsys.chatspring.exceptions.MailInvalidException;
import com.chainsys.chatspring.exceptions.NameInvalidException;
import com.chainsys.chatspring.exceptions.PasswordValidException;
import com.chainsys.chatspring.exceptions.SecureValidException;

public class Validation {

	public Boolean nameValid(String input) throws NameInvalidException {

		String regex = "[a-z.A-Z]+";// Initializing name format
		Pattern pat = Pattern.compile(regex);
		Matcher valid = pat.matcher(input);
		Boolean a = valid.matches();
		String regex1 = "^.{4,25}$";
		Pattern p = Pattern.compile(regex1);
		Matcher valid1 = p.matcher(input);
		Boolean b = valid1.matches();
		if (a.equals(b)) {
			return true;
		}

		else {
			throw new NameInvalidException();
		}

	}

	public Boolean mailValid(String input) throws MailInvalidException {

		String regex = "^[^\\s@]+@chainsys\\.com$";// Initializing Mail Id format
		Pattern pat = Pattern.compile(regex);
		Matcher valid = pat.matcher(input);
		Boolean res = valid.matches();// check whether the Mail matches the format?
		if (res.equals(true)) {
			return res;
		} else {
			throw new MailInvalidException();
		}
	}

	public Boolean passwordValid(String password) throws PasswordValidException {

		String regex = "^\\d{6,}$";// Initialize the format

		Pattern pw = Pattern.compile(regex);

		Matcher matcher = pw.matcher(password);
		Boolean ans = matcher.matches(); // check the Password matches the format?
		if (ans.equals(true)) {
			return ans;
		} else
			throw new PasswordValidException();

	}

	public Boolean entryValid(Integer in) throws InvalidInputException {

		String s = String.valueOf(in);

		String regex = "^\\d$";// Initialize the format

		Pattern pw = Pattern.compile(regex);

		Matcher matcher = pw.matcher(s);
		Boolean ans = matcher.matches(); // check the Password matches the format?
		if (ans.equals(true)) {
			return ans;
		} else
			throw new InvalidInputException();

	}

	public Boolean securityQuestion(String secure) throws SecureValidException {

		String regex = "^[a-zA-Z]{6,}$";// Initialize the format

		Pattern sec = Pattern.compile(regex);

		Matcher matcher = sec.matcher(secure);
		Boolean ans = matcher.matches(); // check the Password matches the format?
		if (ans.equals(true)) {
			return ans;
		} else
			throw new SecureValidException();

	}

}
