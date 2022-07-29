<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class UjianPeserta
 * 
 * @property int $id
 * @property int|null $sesi_id
 * @property int|null $peserta_id
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property SysUser|null $sys_user
 * @property UjianSession|null $ujian_session
 * @property Collection|UjianPesertaJawaban[] $ujian_peserta_jawabans
 *
 * @package App\Models
 */
class UjianPeserta extends Model
{
	protected $table = 'ujian_peserta';

	protected $casts = [
		'sesi_id' => 'int',
		'peserta_id' => 'int'
	];

	protected $fillable = [
		'sesi_id',
		'peserta_id'
	];

	public function sys_user()
	{
		return $this->belongsTo(SysUser::class, 'peserta_id');
	}

	public function ujian_session()
	{
		return $this->belongsTo(UjianSession::class, 'sesi_id');
	}

	public function ujian_peserta_jawabans()
	{
		return $this->hasMany(UjianPesertaJawaban::class, 'peserta_id');
	}
}
