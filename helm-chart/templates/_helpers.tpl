{{- define "ai-devops.name" -}}
ai-devops
{{- end }}

{{- define "ai-devops.fullname" -}}
{{ include "ai-devops.name" . }}
{{- end }}
