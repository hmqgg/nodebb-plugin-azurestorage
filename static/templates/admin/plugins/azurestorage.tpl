<h3>Environment Variables</h3>
<pre><code>export AZURE_STORAGE_ACCOUNT="xxxxx"
export AZURE_STORAGE_ACCESS_KEY="yyyyy"
export AZURE_STORAGE_CONTAINER="zzzz"
export AZURE_STORAGE_HOSTNAME="host"
export AZURE_STORAGE_PATH="path"
</code></pre>

<div class="alert alert-warning">
	<p>If you need help, create an <a href="https://github.com/hmqgg/nodebb-plugin-azurestorage/issues/">issue on
		Github</a>.</p>
</div>

<h3>Database Stored configuration:</h3>
<form id="azurestorage-container">
	<label for="container">Container</label><br/>
	<input type="text" id="azcontainer" name="container" value="{container}" title="Azure Storage Blob Container" class="form-control input-lg"
	       placeholder="mycontainer"><br/>

	<label for="azhost">Host</label><br/>
	<input type="text" id="azhost" name="host" value="{host}" title="Azure Storage Host" class="form-control input-lg"
	       placeholder="mywebsite.azureedge.net"><br/>

	<label for="azpath">Path</label><br/>
	<input type="text" id="azpath" name="path" value="{path}" title="Azure Storage Path" class="form-control input-lg"
	       placeholder="/assets"><br/>
	<br/>

	<button class="btn btn-primary" type="submit">Save</button>
</form>

<br><br>
<form id="azurestorage-credentials">
	<label for="bucket">Credentials</label><br/>
	<div class="alert alert-warning">
		Configuring this plugin using the fields below is <strong>NOT recommended</strong>, as it can be a potential
		security issue. We highly recommend that you investigate using either <strong>Environment Variables</strong> or
		<strong>Instance Meta-data</strong>
	</div>
	<input type="text" name="accessKeyId" value="{accessKeyId}" maxlength="20" title="Access Key ID"
	       class="form-control input-lg" placeholder="Access Key ID"><br/>
	<input type="text" name="secretAccessKey" value="{secretAccessKey}" title="Secret Access Key"
	       class="form-control input-lg" placeholder="Secret Access Key"><br/>
	<button class="btn btn-primary" type="submit">Save</button>
</form>

<script>
	$(document).ready(function () {

		$("#azurestorage-container").on("submit", function (e) {
			e.preventDefault();
			save("assettings", this);
		});

		$("#azurestorage-credentials").on("submit", function (e) {
			e.preventDefault();
			var form = this;
			bootbox.confirm("Are you sure you wish to store your credentials for accessing Azure Storage in the database?", function (confirm) {
				if (confirm) {
					save("credentials", form);
				}
			});
		});

		function save(type, form) {
			var data = {
				_csrf: '{csrf}' || $('#csrf_token').val()
			};

			var values = $(form).serializeArray();
			for (var i = 0, l = values.length; i < l; i++) {
				data[values[i].name] = values[i].value;
			}

			$.post('{forumPath}api/admin/plugins/azurestorage/' + type, data).done(function (response) {
				if (response) {
					ajaxify.refresh();
					app.alertSuccess(response);
				}
			}).fail(function (jqXHR, textStatus, errorThrown) {
				ajaxify.refresh();
				app.alertError(jqXHR.responseJSON ? jqXHR.responseJSON.error : 'Error saving!');
			});
		}
	});
</script>
