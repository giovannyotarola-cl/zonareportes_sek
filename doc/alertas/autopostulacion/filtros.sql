
--[sp_get_datos_contratos] 2
insert into @tabla_filtros 
	select 
	distinct facultad as value, 
	facultad as name 
	from #datos_contratos
	order by facultad

set @tot_registros = (select count(*) from @tabla_filtros)

set @html = '<select><option value="0">Seleccione filtro</option>'

	while(@tot_registros >= @contador)
	begin
		set @html = @html + '<option value="'+ (select value from @tabla_filtros where id = @contador) +'">' + (select name from @tabla_filtros where id = @contador) + '</option>'

		set @contador = @contador + 1
	end
	
	set @html = @html + '</select>'

	select @html as 'html'

END

IF @condicion = 3
BEGIN
insert into @tabla_filtros
	select 
	distinct carrera as value, 
	carrera as name 
	from #datos_contratos
	order by carrera

	set @tot_registros = (select count(*) from @tabla_filtros)

	set @html = '<select><option value="0"></option>'

	while(@tot_registros >= @contador)
	begin
		set @html = @html + '<option value="'+ (select value from @tabla_filtros where id = @contador) +'">' + (select name from @tabla_filtros where id = @contador) + '</option>'

		set @contador = @contador + 1
	end
	
	set @html = @html + '</select>'

	select @html
END

IF @condicion = 4
BEGIN
insert into @tabla_filtros
	select 
	distinct cohorte as value, 
	cohorte as name 
	from #datos_contratos
	order by cohorte

	set @tot_registros = (select count(*) from @tabla_filtros)

	set @html = '<select><option value="0"></option>'

	while(@tot_registros >= @contador)
	begin
		set @html = @html + '<option value="'+ (select value from @tabla_filtros where id = @contador) +'">' + (select name from @tabla_filtros where id = @contador) + '</option>'

		set @contador = @contador + 1
	end
	
	set @html = @html + '</select>'

	select @html
END

IF @condicion = 5
BEGIN
insert into @tabla_filtros
	select 
	distinct a.jornada as value, 
	b.descripcion as name 
	from #datos_contratos a
	inner join ra_jornada b 
	on a.jornada = b.jornada
	order by b.descripcion

	set @tot_registros = (select count(*) from @tabla_filtros)

	set @html = '<select><option value="0"></option>'

	while(@tot_registros >= @contador)
	begin
		set @html = @html + '<option value="'+ (select value from @tabla_filtros where id = @contador) +'">' + (select name from @tabla_filtros where id = @contador) + '</option>'

		set @contador = @contador + 1
	end
	
	set @html = @html + '</select>'

	select @html
END

IF @condicion = 6
BEGIN
insert into @tabla_filtros
	select 
	distinct estado as value, 
	estado as name 
	from #datos_contratos
	order by estado

	set @tot_registros = (select count(*) from @tabla_filtros)

	set @html = '<select><option value="0"></option>'

	while(@tot_registros >= @contador)
	begin
		set @html = @html + '<option value="'+ (select value from @tabla_filtros where id = @contador) +'">' + (select name from @tabla_filtros where id = @contador) + '</option>'

		set @contador = @contador + 1
	end
	
	set @html = @html + '</select>'

	select @html
END

