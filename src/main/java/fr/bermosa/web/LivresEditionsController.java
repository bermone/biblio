package fr.bermosa.web;
import fr.bermosa.domain.LivresEditions;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/livreseditionses")
@Controller
@RooWebScaffold(path = "livreseditionses", formBackingObject = LivresEditions.class)
public class LivresEditionsController {
}
