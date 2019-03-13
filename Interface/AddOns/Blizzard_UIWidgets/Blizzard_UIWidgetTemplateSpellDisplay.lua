local function GetSpellDisplayVisInfoData(widgetID)
	local widgetInfo = C_UIWidgetManager.GetSpellDisplayVisualizationInfo(widgetID);
	if widgetInfo and widgetInfo.shownState ~= Enum.WidgetShownState.Hidden then
		return widgetInfo;
	end
end

UIWidgetManager:RegisterWidgetVisTypeTemplate(Enum.UIWidgetVisualizationType.SpellDisplay, {frameType = "FRAME", frameTemplate = "UIWidgetTemplateSpellDisplay"}, GetSpellDisplayVisInfoData);

UIWidgetTemplateSpellDisplayMixin = CreateFromMixins(UIWidgetBaseTemplateMixin);

function UIWidgetTemplateSpellDisplayMixin:Setup(widgetInfo)
	UIWidgetBaseTemplateMixin.Setup(self, widgetInfo);

	self.Spell:Setup(widgetInfo.spellInfo, widgetInfo.enabledState, widgetInfo.widgetWidth, widgetInfo.iconSizeType);
	if self.fontColor then
		self.Spell:SetFontColor(self.fontColor);
	end

	self:SetWidth(self.Spell:GetWidth());
	self:SetHeight(self.Spell:GetHeight() + 2);
end

function UIWidgetTemplateSpellDisplayMixin:OnReset()
	UIWidgetBaseTemplateMixin.OnReset(self);
	self.fontColor = nil;
end

function UIWidgetTemplateSpellDisplayMixin:SetFontStringColor(fontColor)
	self.fontColor = fontColor;
end
