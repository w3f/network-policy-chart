{{/* Generates allowed pods for pod or order $i */}}
{{- define "network-policy.allowed-connections" -}}
{{- if and ( gt .i 0 ) ( lt .i (sub .Values.size 1)) }}
- {{ .Values.labelSelector.valuePrefix }}-{{ sub .i 1 }}
- {{ .Values.labelSelector.valuePrefix }}-{{ add .i 1 }}
{{- else if eq .i 0 }}
- {{ .Values.labelSelector.valuePrefix }}-1
  {{- if eq .Values.topology "circle" }}
- {{ .Values.labelSelector.valuePrefix }}-{{ sub .Values.size 1 }}
  {{- end }}
{{- else }}
- {{ .Values.labelSelector.valuePrefix }}-{{ sub .i 1 }}
  {{- if eq .Values.topology "circle" }}
- {{ .Values.labelSelector.valuePrefix }}-0
  {{- end }}
{{- end }}
{{- end }}
